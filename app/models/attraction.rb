class Attraction < ActiveRecord::Base
  belongs_to :event

  validates_uniqueness_of :artist_id
end
