class Venue < ActiveRecord::Base
  has_many :events

  validates_uniqueness_of :ticketweb_venue_id

  def populate(data)
    @ticketweb_venue_id = 	data['venue']['venueid']
    @name = 				data['venue']['name']
    @url = 					data['venue']['venueurl']
    @city = 				data['venue']['city']
    @state = 				data['venue']['state']
    @postal_code = 			data['venue']['postalcode']
    @country = 				data['venue']['country']
    @address = 				data['venue']['address']
    @twitter_id = 			data['venue']['twitterid']
    @venue_image_large = 	data['venue']['venueimages']['large']
    @venue_image_small =  	data['venue']['venueimages']['small']
  end
end
