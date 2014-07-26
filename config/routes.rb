Rails.application.routes.draw do
  resources :people, except: :show do
    resources :choice, only: [:update]
  end
  resources :invites, only: [:new, :create]
  resources :rsvps, only: [:edit, :update]
end
