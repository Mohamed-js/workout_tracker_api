Rails.application.routes.draw do
  root "home#index"

  namespace :api do
    namespace :v1 do
      post 'users/sign-up', to: "users#create"
      post 'users/sign-in', to: "users#session"
      get 'movements', to: "movements#index"
      get 'movements/new/:name/:movement_id', to: "movements#new_tracked_movement"

      get 'trial', to: "users#trial"
    end
  end
end
