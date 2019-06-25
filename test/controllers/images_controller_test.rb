require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @image = Image.create!(url: 'https://learn.appfolio.com/apm/www/images/apm-logo-v2.png')
  end

  test 'new image path appears correctly' do
    get new_image_path

    assert_response :success
    assert_select '#header', 'New Image'
    assert_select 'form[action=?]', '/images'
    assert_select 'input[name=?]', 'image[url]'
  end

  test 'show image path appears correctly' do
    get image_path(@image.id)

    assert_response :ok
    assert_select '#header', 'Your beautiful image:'
    assert_select 'img' do
      assert_select '[src=?]', @image.url
    end
  end
end
