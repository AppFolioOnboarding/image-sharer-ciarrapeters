class HomeController < ApplicationController
  def index
    @images = if params[:tag]
                Image.tagged_with(params[:tag]).order(created_at: :desc)
              else
                Image.all.order(created_at: :desc)
              end
  end
end
