class LocationController < ApplicationController
  def create
    location = Location.new(location_params)

    render_errors(location.errors) unless location.valid?

    render json: { location: location }, status: :created if location.save
  end

  def index
    locations = Location.all

    render json: { locations: locations }, status: :ok
  end

  private

  def location_params
    params.require(:location).permit(:name, :address, :city, :longitude, :latitude)
  end
end
