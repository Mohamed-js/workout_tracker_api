Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      root to: 'movements#index'
      resources :users, only: [:show, :create, :update]
      resources :sessions, only: :create
      resources :records, only: [:index, :create, :show]
      namespace :movements do
        resources :tracked_movements, only: [:index, :create]
        resources :untracked_movements, only: :index
      end
    end
  end
end
