require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  setup do
    image = Image.create!(url: 'https://media.glassdoor.com/employerbenefits/o/1/appfolio-employerbenefits-1429212670338.jpg',
                          tag_list: 'appfolio, office')
    image2 = Image.create!(url: 'https://media.glassdoor.com/employerbenefits/o/2/appfolio-employerbenefits-1429212670338.jpg',
                           tag_list: 'california, best workplaces')
    image3 = Image.create!(url: 'https://media.glassdoor.com/employerbenefits/o/3/appfolio-employerbenefits-1429212670338.jpg',
                           tag_list: 'appfolio, office, best workplaces')
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
    assert_select '#tags', "Tags: #{@images.first.tag_list}"
    assert_select 'form[class=?]', 'button_to'
    assert_select 'form[action=?]', "/images/#{@images.first.id}"
  end

  test 'filtering based on tags' do
    get tag_url(@images[0].tag_list.first)

    assert_response :success
    assert_select '#tags', 'Tags: appfolio, office, best workplaces'
    assert_select 'img' do
      assert_select '[src=?]', @images[0].url
      assert_select '[src=?]', @images[2].url
      assert_select '[src=?]', @images[1].url, false
    end
  end

  test 'clickability of tags' do
    get tag_url(@images[0].tag_list.first)

    assert_select 'a[href=?]', '/tags/appfolio'
    assert_select 'a[href=?]', '/tags/office'
    assert_select 'a[href=?]', '/tags/california', count: 0
    assert_select 'a[href=?]', '/tags/best%20workplaces'
  end
end
