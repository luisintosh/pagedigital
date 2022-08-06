module ApplicationHelper
  def attached_image_tag(attached_file, placeholder_path, options = {})
    image_path = attached_file.representable? ? attached_file : placeholder_path
    image_tag(image_path, options)
  end

  def content_item_image_tag(attached_file, item_url, options = {})
    icon_path = url_icon_path(item_url) || 'link_thumbnail_placeholder.svg'
    attached_image_tag(attached_file, icon_path, options)
  end

  def url_icon_path(url)
    uri = URI.parse(url)
    hostname = uri.hostname
    return unless hostname

    hostname.slice!('www.')
    icon_name = "icons/#{hostname}.svg"
    has_asset?(icon_name) && icon_name
  end

  def has_asset?(path)
    begin
      image_path(path)
      true
    rescue
      false
    end
  end
end
