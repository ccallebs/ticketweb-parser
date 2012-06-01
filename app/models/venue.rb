class Venue < ActiveRecord::Base
  has_many :events

  validates_uniqueness_of :ticketweb_venue_id

  attr_accessor :id, :ticketweb_venue_id, :name, :url, :city, :state, :postal_code,
  	:country, :address, :twitter_id, :venue_image_large, :venue_image_small, 
  	:created_at, :updated_at
end
