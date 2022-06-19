class ApplicationController < ActionController::Base
  before_action :set_page

  private

  def set_page
    @page = Page.find_by!(slug: params[:page_slug]) unless params[:page_slug].empty?
  end
end
