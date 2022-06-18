Rails.application.routes.draw do
  
  root 'home#index'
  get 'registration_form' => 'home#registration_form'
end
