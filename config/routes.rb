Rails.application.routes.draw do
  resources :ads_hits
  resources :ads_relations
  resources :ads
  root 'ads#index'

  get	'/countries', to: 'country_configs#index'
  get 	'/countries/count', to: 'country_configs#index_count'
  get 	'/country/ads/:iso', to: 'country_configs#show'
  get	'/ads/action/count', to: 'ads#index_count'

  get 	'/test', to: 'application#index'
end
