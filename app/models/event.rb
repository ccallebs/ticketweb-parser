class Event < ActiveRecord::Base
  belongs_to :ticketweb_venue, :class_name => "Venue"
  has_many :attractions
end
