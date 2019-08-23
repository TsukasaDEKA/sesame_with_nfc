Rails.application.routes.draw do
  resources :door_logs
  resources :sesame_devices
  resources :nfc_cards
  resources :users
  resources :organizations

  mount Swn::API => '/'
end
