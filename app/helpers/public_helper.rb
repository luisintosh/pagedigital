module PublicHelper
  def profile_page_header_image_url
    if @page && @page.page_profile.header_image.representable?
      url_for(@page.page_profile.header_image)
    else
      asset_path('header_image_placeholder.svg')
    end
  end

  def theme_css_class
    if @page.page_appearance.theme_light?
      "schema-light"
    elsif @page.page_appearance.theme_dark?
      "schema-dark"
    end
  end
end
