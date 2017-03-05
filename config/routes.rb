Rails.application.routes.draw do
  resources :ads_relations
  resources :ads
  root 'ads#index'
  get	'/countries', to: 'country_configs#index'
  get 	'/country/ads/:iso', to: 'country_configs#show'
end
