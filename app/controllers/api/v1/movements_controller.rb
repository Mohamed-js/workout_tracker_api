class Api::V1::MovementsController < ApplicationController
    def index
        @movements = Movement.all
        render :json => @movements, status: :ok
    end
end