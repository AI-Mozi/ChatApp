Rails.application.routes.draw do
  
  devise_for :users, :controllers => {
    registrations: 'registrations',
    confirmations: 'confirmations'
  }

  root to: "rooms#index"

  resources :rooms
  resources :messages

  get 'current_user' => "rooms#get_current_user"
end
