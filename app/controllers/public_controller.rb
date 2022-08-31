class PublicController < ApplicationController
  layout 'public_application'
  skip_before_action :authenticate_user!

  def index
  end

  def terms
  end

  def privacy
  end

  def thank_you
  end

  # GET/POST /:page_slug
  def page
    @page = Page.includes_all.find_by!(slug: page_params[:page_slug])
    if @page.published && (@page.lock_code.empty? || @page.lock_code == page_params[:unlock_code])
      render 'page'
    else
      render 'restricted_page', status: :forbidden
    end
  end

  private

  def page_params
    params.permit(:page_slug, :unlock_code, :authenticity_token)
  end
end
