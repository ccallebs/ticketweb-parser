module TicketWebAPI
  require 'httparty'
  require 'json'

  def get_page(number)
    current_url = base_url + number

    response = HTTParty.get(current_url)

    begin 
      json = JSON.parse(response.body)

      json['events'].each do |e|
        create_objects(e)
      end
    #rescue
     # return false
    end
  end

  private
  def create_objects (event)
    new_venue = Venue.new_with_data(event)

    # saving venue
    new_venue.save

    new_event = Event.new_with_data(event)

    new_event.save
    new_venue.events << new_event
    new_venue.save

    # adding attractions to event
    event['attractionList'].each do |a|
      new_attraction = Attraction.new_with_data(a)

      # saving attraction
      new_attraction.save

      # performing final event save
      new_event.attractions << new_attraction
      new_event.save
    end

    puts "Event count #{Event.all.count} || Venue count #{Venue.all.count} || Attraction count #{Attraction.all.count}"

    puts "Event #{event['eventid']} saved..."
  end

  def base_url
    "http://api.ticketweb.com/snl/EventAPI.action?key=OnTLfy5CJ7XX1mLwynRp&version=1&method=json&page="
  end
end