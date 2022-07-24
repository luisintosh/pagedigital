module PublicHelper
  def profile_page_header_image_url
    if @page && @page.page_profile.header_image.representable?
      url_for(@page.page_profile.header_image)
    else
      asset_path('header_image_placeholder.svg')
    end
  end

  def schema_color_css_class
    if @page.page_appearance.theme_light?
      'schema-light'
    elsif @page.page_appearance.theme_dark?
      'schema-dark'
    end
  end

  def theme_color_css_class
    color = @page.page_appearance.primary_color
    color.blank? ? '' : "theme-#{color}"
  end

  def font_css_class
    font_name = @page.page_appearance.font
    font_name.blank? ? '' : "font-#{font_name}"
  end
end
