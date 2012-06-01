class Event < ActiveRecord::Base
  belongs_to :venue
  has_many :attractions

  validates_uniqueness_of :ticketweb_event_id
end
