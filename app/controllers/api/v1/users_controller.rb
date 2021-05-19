class Api::V1::UsersController < ApplicationController
    def create
        @user = User.new(user_params)
        if @user.save
            render :json => {message: 'Successfully signed up!'}, status: :ok
        end
    end

    def session
        @user = User.where(name: params[:name], password: params[:password])
        render :json => @user, status: :ok
    end

    def update_user_profile
        @user = User.find(params[:user_id])
        
        @user.last_weight = @user.current_weight
        @user.last_right_arm_size = @user.current_right_arm_size
        @user.last_left_arm_size = @user.current_left_arm_size

        @user.current_weight = params[:weight]
        @user.height = params[:height]
        @user.current_right_arm_size = params[:right_arm]
        @user.current_left_arm_size = params[:left_arm]

        if @user.save
            render :json => {message: 'Successfully updated!'}
        end
    end
    

    private
    def user_params
        params.require(:user).permit(:name, :password, :birth_date)
    end
end
