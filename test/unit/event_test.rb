require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "Add new attraction to event" do
  	event = Event.new
  	event.name = "Test event"
  	event.save
  	event.attractions.create

  	assert event.attractions.count == 1
  end
end
