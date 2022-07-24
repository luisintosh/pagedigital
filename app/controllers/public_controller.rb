class PublicController < ApplicationController
  layout 'public_application'

  def index
  end

  def page
    @page = Page.includes_all.find_by!(slug: params[:page_slug])
    render layout: 'public_page'
  end
end
