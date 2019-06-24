require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test 'new image path appears correctly' do
    get new_image_path

    assert_response :success
    assert_select '#header', 'New Image'
    assert_select 'form[action=?]', '/images'
    assert_select 'input[name=?]', 'image[url]'
  end
end
