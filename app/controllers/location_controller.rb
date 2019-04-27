class LocationController < ApplicationController
  def create
    location = Location.new(location_params)

    render_errors(location.errors) unless location.valid?
  end

  private

  def location_params
    params.require(:location).permit(:name, :address, :city, :longitude, :latitude)
  end
end
