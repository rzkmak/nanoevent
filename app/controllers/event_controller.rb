class EventController < ApplicationController
  def create
    event = Event.new(event_params)

    render_errors(event.errors) unless event.valid?
  end

  private

  def event_params
    params.require(:event).permit(:name, :organizer, :capacity, :start_date, :end_date, :location_id)
  end
end
