class ApplicationController < ActionController::API
  include Authenticable
  before_action :authorize_request

  def render_error(message, status_code)
    render json: {
      error: {
        message:,
        code: status_code
      }
    }, status: status_code
  end

  def set_user
    @user = User.find(params[:user_id]) if params[:user_id]
  end
end
