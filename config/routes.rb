Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :exchange_rates, only: :index
      get 'exchange_rates/:currency_to', to: 'exchange_rates#show'
    end
  end
end
