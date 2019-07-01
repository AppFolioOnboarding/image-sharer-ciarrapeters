module Images
  class IndexPage < AePageObjects::Document
    path :root

    element :add_image_button, locator: '.js-add-image-link'

    collection :images, locator: 'tbody', item_locator: 'tr' do
      element :image, locator: '.js-image-url'
      element :tags, locator: '.js-image-tags'
      form_for :delete_button, locator: '.js-delete-button' do
        element :button, locator: '.js-delete-image-link'
      end

      def delete_image!
        delete_button.button.node.click
        alert = node.base.driver.browser.switch_to.alert
        yield alert if block_given?
        alert.accept
        sleep 3
        stale!
        window.change_to(IndexPage)
      end
    end

    def add_image!
      add_image_button.node.click
      stale!
      window.change_to(NewPage)
    end
  end
end
