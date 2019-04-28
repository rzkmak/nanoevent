class EventController < ApplicationController
  def create
    event = Event.new(event_params)

    render_errors(event.errors) unless event.valid?

    render json: { event: event }, status: :created if event.save
  end

  def index
    event = Event.includes(:location, :tickets)

    render json: event, status: :ok, each_serializer: EventSerializer
  end

  def create_ticket
    ticket = Ticket.new(ticket_params)

    event = Event.find(ticket_params[:event_id])

    if event.capacity < ticket.quota
      render_errors('Failed Ticket Create': 'Event has not enough capacity')
      return
    end

    event.capacity = event.capacity - ticket.quota
    event.save

    render_errors(ticket.errors) unless ticket.valid?

    render json: { ticket: ticket }, status: :created if ticket.save
  rescue ActiveRecord::RecordNotFound
    render_errors('Ticket Create Error': 'Invalid Event ID')
  end

  private

  def event_params
    params.require(:event).permit(:name, :organizer, :capacity, :start_date, :end_date, :location_id)
  end

  def ticket_params
    params.require(:ticket).permit(:name, :quota, :price, :description, :start_sell, :end_sell, :event_id)
  end
end
