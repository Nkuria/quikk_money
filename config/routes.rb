Rails.application.routes.draw do
  # Api version namespacing
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, except: %i[destroy]
      post 'user/login', to: 'users#login'
      resources :top_ups, except: %i[destroy update]
      resources :transactions, except: %i[destroy update]
      get '/email_transactions', to: 'transactions#send_csv_via_email'
    end
  end
end
