class Venue < ActiveRecord::Base
  has_many :events, :foreign_key => "ticketweb_venue_id"
end
