require 'jwt'

module AuthenticationHelper
  def authenticate(user)
    payload = { user_id: user.id }
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end
end
