require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  setup do
    image = Image.create!(url: 'https://media.glassdoor.com/employerbenefits/o/1/appfolio-employerbenefits-1429212670338.jpg')
    image2 = Image.create!(url: 'https://media.glassdoor.com/employerbenefits/o/2/appfolio-employerbenefits-1429212670338.jpg')
    image3 = Image.create!(url: 'https://media.glassdoor.com/employerbenefits/o/3/appfolio-employerbenefits-1429212670338.jpg')
    @images = [image, image2, image3]
  end

  test 'should get index' do
    get root_url

    assert_response :success
    assert_select '#header', 'Welcome to the Super Awesome Image Sharer App!'
    assert_select 'a[href=?]', '/images/new'
    @images.each do |image|
      assert_select 'img' do
        assert_select '[src=?]', image.url
      end
    end
  end
end
