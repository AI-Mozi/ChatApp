Rails.application.routes.draw do
  resources :messages
  resources :rooms
  devise_for :users, :controllers => {
    registrations: 'registrations',
    confirmations: 'confirmations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "rooms#index"

  resources :rooms
  resources :messages

  get 'current_user' => "rooms#get_current_user"
end
