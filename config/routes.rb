Rails.application.routes.draw do
  devise_for :users
  resources :freelancers
  
  root 'home#index'
  get 'registration_form' => 'home#registration_form'
end
