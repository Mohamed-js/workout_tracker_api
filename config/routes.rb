Rails.application.routes.draw do
  root "home#index"

  namespace :api do
    namespace :v1 do
      post 'users/sign-up', to: "users#create"
      post 'users/sign-in', to: "users#session"
      
      # NEW RECORD #
      post 'user/records/new', to: "movements#new_record"

      # SUBSCRIBE TO MOVEMENT #
      post 'movements/new', to: "movements#new_tracked_movement"

      # UPDATE USER PROFILE #
      post 'user/profile', to: "users#update_user_profile"

      # USER AVAILABLE MOVEMENTS #
      get 'user/:id/untracked-movements', to: "movements#index"

      # USER RECORDS #
      get 'user/:id/records', to: "movements#user_records"

      # USER TOP SCORE #
      get 'user/:id/:movement_id/topscore', to: "movements#top_score"

      # USER TRACKED MOVEMENTS #
      get 'user/:id/tracked-movements', to: "movements#tracked_movements"
    end
  end
end
