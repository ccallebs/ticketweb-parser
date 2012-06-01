class PagesController < ApplicationController
  def index
  end

  def events
  	@events = Event.all
  end

  def venues
  	@venues = Venue.all
  end
end
