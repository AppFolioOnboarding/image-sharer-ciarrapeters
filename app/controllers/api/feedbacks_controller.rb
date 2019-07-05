module Api
  class FeedbacksController < ApplicationController
    def create
      render json: { message: 'Thank you for giving us feedback!' }, status => :ok
    end
  end
end
