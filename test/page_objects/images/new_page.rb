module Images
  class NewPage < AePageObjects::Document
    # path Rails.application.routes.url_helpers.new_image_path
    path :new_image

    form_for :image, locator: '.js-image-form' do
      element :url, locator: '.js-image-url'
      element :tag_list, locator: '.js-image-tag-list'
      element :submit_button, locator: '.js-submit-button'
    end

    def create_image!(url: nil, tags: nil)
      image.url.set(url)
      image.tag_list.set(tags)
      image.submit_button.node.click
      stale!
      window.change_to(ShowPage)
    end
  end
end
