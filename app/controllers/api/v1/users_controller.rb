class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show update]

  def show
    render json: @user, only: [:name, :height, :current_weight, :last_weight], status: :ok
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: { message: 'Successfully signed up!' }, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    @user.last_weight = @user.current_weight
    @user.current_weight = params[:weight]
    @user.height = params[:height]

    if @user.save
      render json: { message: 'Successfully updated!' }
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :birth_date)
  end

  def set_user
    if request.headers['Authorization'].present?
      @user = User.find_by(authentication_token: request.headers['Authorization'])
      if !@user
        render json: {
          token: 'Wrong Token'
        }, status: :unprocessable_entity
      end
    else
      render json: {
        token: 'Missing Token'
      }, status: :unprocessable_entity
    end
  end
end
