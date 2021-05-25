class Api::V1::SessionsController < ApplicationController
    def create
        @user = User.find_by(name: params[:name])
        if @user && @user.authenticate(params[:password])
            render json: @user, only: [:name, :authentication_token], status: :ok
        else
            render json: { failure: 'There is no such user.' }, status: :unauthorized
        end
    end
end
