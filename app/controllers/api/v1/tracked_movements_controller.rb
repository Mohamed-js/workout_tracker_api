class Api::V1::TrackedMovementsController < ApplicationController
    before_action :set_user

    # ALL TRACKED MOVEMENTS
    def index
      @movements = @user.movements.uniq
      render json: @movements, status: :ok
    end

    # ADD NEW TRACKED MOVEMENT
    def create
      movement = @user.tracked_movements.build(movement_id: params[:movement_id], movement_count: 0)
      render json: { message: 'Successfully added!' }, status: :ok if movement.save
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
  