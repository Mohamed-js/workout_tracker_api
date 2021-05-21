class Api::V1::UsersController < ApplicationController
    def create
        @user = User.new(user_params)
        if @user.save
            render :json => {message: 'Successfully signed up!'}, status: :ok
        else
            render :json => { :errors => @user.errors.full_messages }
        end
    end

    def session
        @user = User.where(name: params[:name], password: params[:password])
        render :json => @user, status: :ok
    end

    def update_user_profile
        @user = User.find(params[:user_id])
        
        @user.last_weight = @user.current_weight

        @user.current_weight = params[:weight]
        @user.height = params[:height]

        if @user.save
            render :json => { message: 'Successfully updated!' }
        else
            render :json => { message: 'Sorry, cannot update!' }
        end
    end
    

    private
    def user_params
        params.require(:user).permit(:name, :password, :birth_date)
    end
end
