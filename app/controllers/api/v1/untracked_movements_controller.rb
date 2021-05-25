class Api::V1::Movements::UntrackedMovementsController < ApplicationController
    before_action :set_user

    # ALL UNTRACKED MOVEMENTS
    def index
        @tracked_movements = @user.movements
        @all_movements = Movement.all
        @movements = @all_movements - @tracked_movements
        render json: @movements, status: :ok
    end

    private
    def set_user
      if request.headers['Authorization'].present?
        @user = User.find_by(authentication_token: request.headers['Authorization'])
        if !@user
          render json: {
            error: 'Not Authorized!'
          }, status: 401
        end
      else
        render json: {
          token: 'Missing Token'
        }, status: :unprocessable_entity
      end
    end
end
  