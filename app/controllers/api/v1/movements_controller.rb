class Api::V1::MovementsController < ApplicationController
    def index
        @user = User.find(params[:id])
        @tracked_movements = @user.movements
        @all_movements = Movement.all

        @movements = @all_movements - @tracked_movements
        render :json => @movements, status: :ok
    end

    def tracked_movements
        @user = User.find(params[:id])
        @movements = @user.movements.uniq
        @tracked = @user.tracked_movements
        render :json => @tracked, :include => :movement , status: :ok
    end

    def new_tracked_movement
        @user = User.where(name: params[:name])
        movement = @user[0].tracked_movements.build(movement_id: params[:movement_id])
        if movement.save 
            render :json => {message: 'Successfully added!'}, status: :ok
        end
    end

    def new_record
        @user = User.where(name: params[:name])
        movement = @user[0].tracked_movements.build(movement_id: params[:movement_id], movement_count: params[:movement_count])
        if movement.save 
            render :json => {message: 'Successfully added!'}, status: :ok
        end
    end
end