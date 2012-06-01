require 'test_helper'

class VenueTest < ActiveSupport::TestCase
  test "add new venue event" do
    # adding or updating venue
    new_venue = Venue.where(:ticketweb_venue_id => 1).first_or_create

    # saving venue
    new_venue.save

    # adding or updating event
    new_event = Event.where(:ticketweb_event_id => 1,
      :venue_id => new_venue.id).first

    if new_event.nil?
      new_venue.events.build do |e|
        e.ticketweb_venue_id = 1
      end
    end

    new_venue.save

    assert new_venue.events.count == 1
  end
end
