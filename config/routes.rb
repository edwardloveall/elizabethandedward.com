Rails.application.routes.draw do
  resources :people, except: :show do
    resources :choice, only: [:update] do
      member do
        put :attending
      end
    end
  end
  resources :invites, only: [:new, :create]
  resources :rsvps, only: [:edit, :update] do
    member do
      post :add_plus_one
    end
  end
end
