class EventController < ApplicationController
  def create
    event = Event.new(event_params)

    render_errors(event.errors) unless event.valid?

    render json: { event: event }, status: :created if event.save
  end

  def create_ticket
    ticket = Ticket.new(ticket_params)

    render_errors(ticket.errors) unless ticket.valid?

    render json: { event: event }, status: :created if ticket.save
  end

  private

  def event_params
    params.require(:event).permit(:name, :organizer, :capacity, :start_date, :end_date, :location_id)
  end

  def ticket_params
    params.require(:ticket).permit(:name, :quota, :price, :description, :start_sell, :end_sell, :event_id)
  end
end
