Rails.application.routes.draw do
  resources :freelancers
  
  root 'home#index'
  get 'registration_form' => 'home#registration_form'
end
