Rails.application.routes.draw do
  root "home#index"

  namespace :api do
    namespace :v1 do
      post 'users/sign-up', to: "users#create"
      post 'users/sign-in', to: "users#session"
      get 'user/records/new/:name/:movement_id/:movement_count', to: "movements#new_record"
      get 'movements/new/:name/:movement_id', to: "movements#new_tracked_movement"

      # USER AVAILABLE MOVEMENTS
      get 'user/:id/untracked-movements', to: "movements#index"

      # USER RECORDS
      get 'user/:id/records', to: "movements#user_records"

      # USER TOP SCORE
      get 'user/:id/:movement_id/topscore', to: "movements#top_score"

      # USER TRACKED MOVEMENTS
      get 'user/:id/tracked-movements', to: "movements#tracked_movements"

    end
  end
end
