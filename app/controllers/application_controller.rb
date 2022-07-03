class ApplicationController < ActionController::Base
  private
  def set_page
    @page = Page.find_by!(slug: params[:page_slug]) unless params[:page_slug].empty?
  end
end
