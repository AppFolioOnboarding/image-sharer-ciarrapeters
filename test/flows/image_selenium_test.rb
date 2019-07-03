require 'test_helper.rb'

class ImageTestSelenium < ActionDispatch::IntegrationTest
  def test_add_image
    index_page = Images::IndexPage.visit
    new_image_page = index_page.add_image!
    image_url = 'https://learn.appfolio.com/apm/www/images/apm-logo-v2.png'
    image_tags = 'appfolio'
    image_show_page = new_image_page.create_image!(
      url: image_url,
      tags: image_tags
    )
    assert_equal image_url, image_show_page.image_url
    assert_equal 'Tags: appfolio', image_show_page.image_tags
  end

  def test_delete_image
    image_url = 'https://learn.appfolio.com/apm/www/images/apm-logo-v2.png'
    image_tags = 'appfolio'
    image_tags2 = 'appfolio, santa barbara'

    image_params = { url: image_url, tag_list: image_tags }
    image = Image.new(image_params)
    image.save!

    image_params2 = { url: image_url, tag_list: image_tags2 }
    image2 = Image.new(image_params2)
    image2.save!

    index_page = Images::IndexPage.visit
    assert_equal 2, index_page.images.count

    index_page2 = index_page.images.first.delete_image! do |alert|
      assert_equal 'Are you sure?',
                   alert.text
    end

    assert_equal 1, index_page2.images.size
  end
end
