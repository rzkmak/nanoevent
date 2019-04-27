class ApplicationController < ActionController::API
  def render_errors(errors)
    render json: { errors: errors }, status: :bad_request
  end
end
