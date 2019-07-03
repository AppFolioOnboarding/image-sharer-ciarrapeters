module Images
  class ShowPage < AePageObjects::Document
    path :image

    def image_url
      node.find('img.js-image-url')['src']
    end

    def image_tags
      node.find('p.js-image-tags').text
    end
  end
end
