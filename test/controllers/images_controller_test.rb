require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @image = Image.create!(url: 'https://learn.appfolio.com/apm/www/images/apm-logo-v2.png', tag_list: 'fun')
  end

  test 'new image path appears correctly' do
    get new_image_path

    assert_response :success
    assert_select '#header', 'New Image'
    assert_select 'form[action=?]', '/images'
    assert_select 'input[name=?]', 'image[url]'
    assert_select 'label', 'Tags (separated by commas)'
    assert_select 'input[name=?]', 'image[tag_list]'
  end

  test 'show image path appears correctly' do
    get image_path(@image.id)

    assert_response :ok
    assert_select '#header', 'Your beautiful image:'
    assert_select 'img' do
      assert_select '[src=?]', @image.url
    end
    assert_select '#tags', 'Tags: fun'
  end

  test 'create image success' do
    assert_difference('Image.count', 1) do
      image_params = { url: 'https://learn.appfolio.com/apm/www/images/apm-logo-v2.png' }
      post images_path, params: { image: image_params }
    end

    assert_redirected_to image_path(Image.last)
    assert_equal 'Image successfully created!', flash[:notice]
  end

  test 'create tags success' do
    assert_difference('ActsAsTaggableOn::Tag.count', 3) do
      image_params = { url: 'https://learn.appfolio.com/apm/www/images/apm-logo-v2.png',
                       tag_list: 'california, appfolio, goleta' }
      post images_path, params: { image: image_params }
    end

    assert_redirected_to image_path(Image.last)
    assert_equal 'Image successfully created!', flash[:notice]
    Image.last.tags.each do |tag|
      assert_equal tag.name.in?('california, goleta, appfolio'), true
    end
  end

  test 'create image failure' do
    assert_no_difference('Image.count') do
      image_params = { url: 'dsfdasfdsfdsaf' }
      post images_path, params: { image: image_params }
    end

    assert_redirected_to new_image_path
    assert_equal 'The image provided was invalid. Please try again.', flash[:notice]
  end

  test 'delete image' do
    assert_difference('Image.count', -1) do
      delete image_path(@image.id)
    end

    assert_redirected_to root_path
    assert_select 'img', count: 0
  end
end
