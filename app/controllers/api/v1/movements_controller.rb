class Api::V1::MovementsController < ApplicationController
  before_action :set_user

  def index
    @movements = Movement.all
    render json: @movements
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
