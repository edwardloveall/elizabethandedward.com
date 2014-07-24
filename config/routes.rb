Rails.application.routes.draw do
  resources :people, except: :show
  resources :invites, only: [:new, :create]
  resources :rsvp, only: [:edit, :update]
end
