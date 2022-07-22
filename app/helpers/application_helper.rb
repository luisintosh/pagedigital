module ApplicationHelper
  def attached_image_tag(attached_file, placeholder_file, options = {})
    image_path = attached_file.representable? ? attached_file : placeholder_file
    image_tag(image_path, options)
  end
end
