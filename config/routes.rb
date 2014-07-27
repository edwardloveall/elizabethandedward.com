Rails.application.routes.draw do
  resources :people, except: :show do
    resources :choice, only: [] do
      member do
        put :attending
        put :meal
      end
    end
  end
  resources :invites, only: [:new, :create]
  resources :rsvps, only: [:edit, :update]
end
