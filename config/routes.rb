Rails.application.routes.draw do
  # Api version namespacing
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users
    end
  end
end
