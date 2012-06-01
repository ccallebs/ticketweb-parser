class Venue < ActiveRecord::Base
  has_many :events

  validates_uniqueness_of :ticketweb_venue_id
end
