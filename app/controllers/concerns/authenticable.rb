module Authenticable
  def not_found
    render_error('Not found', 401)
  end

  def authorize_request
    return @current_user if @current_user

    header = request.headers['Authorization']
    header = header.split(' ').last if header
    return render_error('Missing authentication token', 401) if header.nil?

    begin
      decoded = JsonWebToken.decode(header)
      @current_user = User.find(decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render_error(e.message, 401)
    rescue JWT::DecodeError
      render_error('Invalid access token', 401)
    end
  end
end
