class Venue < ActiveRecord::Base
  has_many :events

  validates_uniqueness_of :ticketweb_venue_id

  def twitter_feed(value)
    Twitter.configure do |config|
      config.consumer_key = "A18487A387x94vZWvYDH9Q"
      config.consumer_secret = "F8YAJUHcOYlju05t5ZUzaeWALsR14DEpG0H3IBrjYY"
      config.oauth_token = "https://api.twitter.com/oauth/request_token"
      config.oauth_token_secret = "https://api.twitter.com/oauth/access_token"
    end

    begin
      tweets = Twitter.user_timeline(value, :count => 5)
    rescue
      tweets = [ ]
    end

    tweets
  end

  def formatted_address
    "#{address}, #{city}, #{state} #{postal_code}"
  end

  def ticketweb_url(value)
    "http://www.ticketweb.com/snl/VenueListings.action?venueId=#{value}&pl="
  end

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
