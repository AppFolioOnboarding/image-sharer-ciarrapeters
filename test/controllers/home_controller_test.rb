require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get home_index_url

    assert_response :success
    assert_select '#header', 'Welcome to the Super Awesome Image Sharer App!'
  end
end