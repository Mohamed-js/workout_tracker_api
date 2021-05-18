class Api::V1::MovementsController < ApplicationController

    # UNTRACKED MOVEMENTS
    def index
        @user = User.find(params[:id])
        @tracked_movements = @user.movements
        @all_movements = Movement.all

        @movements = @all_movements - @tracked_movements
        render :json => @movements, status: :ok
    end

    # TRACKED MOVEMENTS
    def tracked_movements
        @user = User.find(params[:id])
        @movements = @user.movements.uniq
        render :json => @movements, status: :ok
    end

    # USER RECORDS
    def user_records
        @user = User.find(params[:id])
        @tracked = @user.tracked_movements
        render :json => @tracked, :include => :movement, status: :ok
    end

    # MAKE UNTRACKED = TRACKED
    def new_tracked_movement
        @user = User.where(name: params[:name])
        movement = @user[0].tracked_movements.build(movement_id: params[:movement_id])
        if movement.save 
            render :json => {message: 'Successfully added!'}, status: :ok
        end
    end

    # ADD NEW RECORD
    def new_record
        @user = User.where(name: params[:name])
        movement = @user[0].tracked_movements.build(movement_id: params[:movement_id], movement_count: params[:movement_count])
        if movement.save 
            render :json => {message: 'Successfully added!'}, status: :ok
        end
    end
end