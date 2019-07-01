module Images
  class IndexPage < AePageObjects::Document
    path :root

    element :add_image_button, locator: '.js-add-image-link'

    collection :images, locator: 'tbody', item_locator: 'tr' do
      element :image, locator: '.js-image-url'
      element :tags, locator: '.js-image-tags'
    end

    def add_image!
      add_image_button.node.click
      stale!
      window.change_to(NewPage)
    end

  end
end
