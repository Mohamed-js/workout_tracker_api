class Api::V1::MovementsController < ApplicationController
    def index
        @movements = Movement.all
        render :json => @movements, status: :ok
    end

    def new_tracked_movement
        @user = User.where(name: params[:name])
        movement = @user[0].tracked_movements.build(movement_id: params[:movement_id])
        if movement.save 
            render :json => {message: 'Successfully added!'}, status: :ok
        end
    end
end