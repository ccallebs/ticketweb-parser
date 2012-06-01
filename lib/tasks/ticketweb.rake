require 'httparty'
require 'json'

namespace :ticketweb do
  desc "Either creates or updates values in the database from the ticketweb api"
  task :load => :environment do
  	@page_num = 1
    @failure_count = 0

  	@ticketweb_url = "http://api.ticketweb.com/snl/EventAPI.action?key=OnTLfy5CJ7XX1mLwynRp&version=1&method=json&page="

    repeat_every(10) do
      puts "Loading ticketweb data page #{@page_num}"
      unless load_ticketweb_page(@page_num)
        if @failure_count < 10 
          puts "No more data, or something went wrong! Skipping page..." 
      	  @failure_count += 1
        else
          puts "Too many failures... Parsing stopped."
        end
      end
      @page_num += 1
    end
  end

  def repeat_every(seconds)
  	loop do
  	  start_time = Time.now
	    yield
	    elapsed = Time.now - start_time
	    sleep([seconds - elapsed, 0].max)
	  end
  end

  def load_ticketweb_page(number)
  	current_url = @ticketweb_url + number.to_s
  	
  	response = HTTParty.get(current_url)

    begin 
  	  json = JSON.parse(response.body)

  	  json['events'].each do |e|
  	    create_objects(e)
      end
    rescue
      return false
    end
  end

  def create_objects (event)
    # adding or updating venue
  	new_venue = Venue.where(:ticketweb_venue_id => event['venue']['venueid']).first

    if new_venue.nil?
      new_venue = Venue.new
    end

    new_venue.ticketweb_venue_id = event['venue']['venueid']
  	new_venue.name = event['venue']['name']
  	new_venue.url = event['venue']['venueurl']
  	new_venue.city = event['venue']['city']
  	new_venue.state = event['venue']['state']
  	new_venue.postal_code = event['venue']['postalcode']
  	new_venue.country = event['venue']['country']
  	new_venue.address = event['venue']['address']
  	new_venue.twitter_id = event['venue']['twitterid']
  	new_venue.venue_image_large = event['venue']['venueimages']['large']
  	new_venue.venue_image_small =  event['venue']['venueimages']['small']

    # saving venue
  	new_venue.save

    # adding or updating event
  	new_event = Event.where(:ticketweb_event_id => event['eventid'],
      :venue_id => new_venue.id).first

    if new_event.nil?
      new_event = new_venue.events.create(:ticketweb_event_id => event['eventid'])
    end

    new_event.ticketweb_venue_id = event['venue']['venueid']
    new_event.ticketweb_event_id = event['eventid']
  	new_event.facebook_event_id = event['facebookeventid']
  	new_event.name = event['eventname']
  	new_event.description = event['description']
  	new_event.url = event['eventurl']
  	new_event.tags = event['tags']
  	new_event.status = event['status']
  	new_event.additional_listing_text = event['additionallistingtext']

  	new_event.start_date = event['dates']['startdate']
  	new_event.end_date = event['dates']['enddate']
  	new_event.on_sale_date = event['dates']['onsaledate']
  	new_event.timezone = event['dates']['timezone']

    unless event['images'].nil?
    	new_event.event_image_url_large = event['images']['large']
    	new_event.event_image_url_small = event['images']['small']
    end

    unless event['prices'].nil?
    	new_event.price_low = event['prices']['pricelow']
    	new_event.price_high = event['prices']['pricehigh']
    	new_event.price_display = event['prices']['pricedisplay']
    end

    new_event.save

  	# adding attractions to event
  	event['attractionList'].each do |a|
  	  new_attraction = Attraction.where(:artist_id => a['artistid']).first_or_create
  	  new_attraction.sequence = a['sequence']
  	  new_attraction.artist_name = a['artist']
  	  new_attraction.billing = a['billing']

      new_attraction.links = ""

  	  unless a['links'].class != "string"
        a['links'].each do |l, index|
  	  	  new_attraction.links += " | " unless index == 0
  	  	  new_attraction.links += l['url']
        end
  	  end

      # saving attraction
      new_attraction.save

      # performing final event save
  	  new_event.attractions << new_attraction
  	  new_event.save
  	end

    puts "Event count #{Event.all.count} || Venue count #{Venue.all.count} || Attraction count #{Attraction.all.count}"

  	puts "Event #{event['eventid']} saved..."
  end
end