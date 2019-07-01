require '/Users/ciarra.peters/image-sharer-ciarrapeters/test/test_helper.rb'

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

end
