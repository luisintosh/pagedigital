class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private
  def set_page
    @page = current_user.pages.find(params[:page_id])
  end
end
