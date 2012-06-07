class Venue < ActiveRecord::Base
  has_many :events

  validates_uniqueness_of :ticketweb_venue_id

  def self.new_with_data(data)
    # adding or updating venue
    venue = Venue.where(:ticketweb_venue_id => data['venue']['venueid']).first_or_create

    venue.name = 				data['venue']['name']
    venue.url = 					data['venue']['venueurl']
    venue.city = 				data['venue']['city']
    venue.state = 				data['venue']['state']
    venue.postal_code = 			data['venue']['postalcode']
    venue.country = 				data['venue']['country']
    venue.address = 				data['venue']['address']
    venue.twitter_id = 			data['venue']['twitterid']
    venue.venue_image_large = 	data['venue']['venueimages']['large']
    venue.venue_image_small =  	data['venue']['venueimages']['small']
    venue
  end
end
