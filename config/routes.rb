Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :top_ups
    end
  end
  # Api version namespacing
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, except: %i[destroy]
      post 'user/login', to: "users#login"
    end
  end
end
