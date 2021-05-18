class Api::V1::UsersController < ApplicationController
    def create
        @user = User.new(user_params)
        if @user.save
            render :json => {message: 'Successfully signed up!'}, status: :ok
        end
    end

    def session
        @user = User.where(name: params[:name], password: params[:password])
        render :json => @user, include: :movements, status: :ok
    end

    def trial
        @user = User.where(name: "hammo", password: "123123")
        render :json => @user, include: :movements, status: :ok
    end
    

    private
    def user_params
        params.require(:user).permit(:name, :password, :birth_date)
    end
end
