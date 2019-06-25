class ImagesController < ApplicationController
  def show
    @image = Image.find(params[:id])
  end

  def new; end

  def create
    @image = Image.new(image_params)

    if @image.save
      redirect_to @image
    else
      redirect_to new_image_path
    end
  end

  private

  def image_params
    params.require(:image).permit(:url)
  end
end
