class ImagesController < ApplicationController
  def show
    @image = Image.find(params[:id])
  end

  def new; end
end
