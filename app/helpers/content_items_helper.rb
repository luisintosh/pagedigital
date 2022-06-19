module ContentItemsHelper
  def content_item_image_tag(content_item, options)
    placeholder = "https://via.placeholder.com/#{options[:size]}.png"
    image_path = content_item.custom_thumbnail_image.representable? ? content_item.custom_thumbnail_image : placeholder
    image_tag(image_path, { size: options[:size] })
  end
end
