class Event < ActiveRecord::Base
  belongs_to :venue
  has_many :attractions

  validates_uniqueness_of :ticketweb_event_id

  def populate(data)
    @ticketweb_event_id = 		data['eventid']
    @ticketweb_venue_id = 		data['venue']['venueid']
    @ticketweb_event_id = 		data['eventid']
    @facebook_event_id = 		data['facebookeventid']
    @name = 					data['eventname']
    @description = 				data['description']
    @url = 						data['eventurl']
    @tags = 					data['tags']
    @status = 					data['status']
    @additional_listing_text = 	data['additionallistingtext']

    @start_date = 				data['dates']['startdate']
    @end_date = 				data['dates']['enddate']
    @on_sale_date = 			data['dates']['onsaledate']
    @timezone = 				data['dates']['timezone']

    unless data['images'].nil?
      @event_image_url_large = 	data['images']['large']
      @event_image_url_small = 	data['images']['small']
    end

    unless data['prices'].nil?
      @price_low = 				data['prices']['pricelow']
      @price_high = 			data['prices']['pricehigh']
      @price_display = 			data['prices']['pricedisplay']
    end
  end
end
