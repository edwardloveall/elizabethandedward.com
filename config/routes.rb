Rails.application.routes.draw do
  root to: 'homes#show'

  resource :home, only: :show
  resource :session, only: [:new, :create, :destroy]
  resources :people, except: :show do
    resources :choice, only: [:update], defaults: { format: :json } do
      member do
        put :attending, defaults: { format: :html }
      end
    end
  end
  resources :invites, only: [:index, :new, :create]
  resources :rsvps, only: [:edit, :update] do
    member do
      post :add_plus_one
    end
  end
end
