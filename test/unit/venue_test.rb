require 'test_helper'

class VenueTest < ActiveSupport::TestCase
  test "Add new event to venue" do
    venue = Venue.new
    venue.name = "Test Venue"
	venue.save

    venue.events.create

    assert venue.events.count == 1
  end
end
