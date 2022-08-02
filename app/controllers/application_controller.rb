class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private
  def set_page
    @page = current_user.pages.find_by!(slug: params[:page_slug])
  end
end
