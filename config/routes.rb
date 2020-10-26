Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :exchange_rates, only: :index
      get 'exchange_rates/:currency_to', to: 'exchange_rates#show'
    end
  end

  # Sidekiq Web UI, only for admins.
  require 'sidekiq/web'
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
