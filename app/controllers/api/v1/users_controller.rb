class Api::V1::UsersController < ApplicationController
    def create
        @user = User.new(user_params)
        if @user.save
            render :json => @user, status: :ok
        end
    end

    def session
        @user = User.where(name: params[:name], password: params[:password])
        render :json => @user, status: :ok
    end
    

    private
    def user_params
        params.require(:user).permit(:name, :password)
    end
end


# render :json => @users, status: :ok

# fetch('http://127.0.0.1:3000/api/v1/users/all', {method: "post"}).then(res => res.json())

# fetch('http://127.0.0.1:3000/api/v1/users/all', {method: "post", headers: {'Content-Type': 'application/json'}, body: JSON.stringify({q: 1})}).then(res => res.json())

# fetch('http://127.0.0.1:3000/api/v1/users/sign-in', {method: "post", headers: {'Content-Type': 'application/json'},
#     body: JSON.stringify({name: "hammo", password:"123"})}).then(res => res.json())