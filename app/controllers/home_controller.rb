class HomeController < ApplicationController
  def index
    @images = Image.all.order(created_at: :desc)
  end
end
