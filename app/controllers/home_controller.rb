class HomeController < ApplicationController
    def index
        @movements = Movement.all
        render :json => @movements, status: :ok
    end
end