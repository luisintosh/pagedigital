class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private
  def set_page
    @page = current_user.pages.find(params[:page_id])
  end

  # redirect to a specific page on successful sign in
  def after_sign_in_path_for(resource)
    pages_path
  end
end
