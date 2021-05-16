class Api::V1::MovementssController < ApplicationController
    def index
        @movements = Movement.all
        render :json => @movements, status: :ok
    end
end