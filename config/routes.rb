Rails.application.routes.draw do
  root "home#index"

  namespace :api do
    namespace :v1 do
      post 'users/sign-up', to: "users#create"
      post 'users/sign-in', to: "users#session"
      get 'movements/:id', to: "movements#index"
      get 'user/:id/movements', to: "movements#tracked_movements"
      get 'movements/new/:name/:movement_id', to: "movements#new_tracked_movement"
      get 'user/records/new/:name/:movement_id/:movement_count', to: "movements#new_record"

      get 'trial', to: "users#trial"
    end
  end
end
