class ImagesController < ApplicationController
  def show
    @image = Image.find(params[:id])
  end

  def new; end

  def create
    @image = Image.new(image_params)

    if @image.save
      flash[:notice] = 'Image successfully created!'
      redirect_to @image
    else
      flash[:notice] = 'The image provided was invalid. Please try again.'
      redirect_to new_image_path
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    redirect_to root_path
  end

  private

  def image_params
    params.require(:image).permit(:url, :tag_list)
  end
end
