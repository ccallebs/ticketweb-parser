class Event < ActiveRecord::Base
  belongs_to :venue
  has_many :attractions

  validates_uniqueness_of :ticketweb_event_id

  def self.new_with_data(data)
    # adding or updating event
    event = Event.where(:ticketweb_event_id => data['eventid']).first_or_create

    event.ticketweb_venue_id = 		    data['venue']['venueid']
    event.ticketweb_event_id = 		    data['eventid']
    event.facebook_event_id = 		    data['facebookeventid']
    event.name = 					            data['eventname']
    event.description = 			       	data['description']
    event.url = 						          data['eventurl']
    event.tags = 					            data['tags']
    event.status = 					          data['status']
    event.additional_listing_text =   data['additionallistingtext']

    unless data['dates'].nil?
      event.start_date = 				data['dates']['startdate']
      event.end_date = 				  data['dates']['enddate']
      event.on_sale_date = 			data['dates']['onsaledate']
      event.timezone = 				  data['dates']['timezone']
    end

    unless data['images'].nil?
      event.event_image_url_large = 	data['images']['large']
      event.event_image_url_small = 	data['images']['small']
    end

    unless data['prices'].nil?
      event.price_low = 				data['prices']['pricelow']
      event.price_high = 			  data['prices']['pricehigh']
      event.price_display = 		data['prices']['pricedisplay']
    end

    event
  end
end
