Rails.application.routes.draw do
  resources :door_logs
  resources :sesame_devices
  resources :nfc_cards
  resources :users
  resources :organizations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
