class Api::V1::RecordsController < ApplicationController
  before_action :set_user

  # ALL USER RECORDS
  def index
    @tracked = @user.tracked_movements.order('created_at DESC')
    render json: @tracked, include: :movement, status: :ok
  end

  # SHOW TOP SCORE
  def show
    @top = @user.tracked_movements.where(movement_id: params[:id]).top_score
    render json: @top, status: :ok
  end

  # CREATE NEW RECORD
  def create
    movement = @user.tracked_movements.build(movement_id: params[:movement_id], movement_count: params[:movement_count])
    render json: { message: 'Successfully added!' }, status: :ok if movement.save
  end

  private

  def set_user
    if request.headers['Authorization'].present?
      @user = User.find_by(authentication_token: request.headers['Authorization'])
      unless @user
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
