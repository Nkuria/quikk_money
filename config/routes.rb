Rails.application.routes.draw do
  # Api version namespacing
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, except: %i[destroy] do
        resources :transactions, only: %i[index]
      end
      post 'user/login', to: 'users#login'
      resources :top_ups, except: %i[destroy update]
      resources :transactions, except: %i[destroy update]
    end
  end
end
