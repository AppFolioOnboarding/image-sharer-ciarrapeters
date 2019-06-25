require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get root_url

    assert_response :success
    assert_select '#header', 'Welcome to the Super Awesome Image Sharer App!'
    assert_select 'a[href=?]', '/images/new'
  end
end
