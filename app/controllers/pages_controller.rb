class PagesController < ApplicationController
  before_action :set_page, only: %i[show edit update update_profile update_appearance update_contact update_integration destroy]

  # GET /pages
  def index
    @pages = Page.all
  end

  # GET /pages/1
  def show
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages
  def create
    @page = Page.new(page_params)

    if @page.save
      redirect_to page_url(@page), notice: "Page was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pages/1
  def update
    if @page.update(page_params)
      redirect_to page_url(@page), notice: "Page was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pages/1/update-appearance
  def update_appearance
    if @page.page_appearance.update(page_appearance_params)
      redirect_to page_url(@page), notice: "Page was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pages/1/update-contact
  def update_contact
    if @page.page_contact.update(page_contact_params)
      redirect_to page_url(@page), notice: "Page was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pages/1/update-integration
  def update_integration
    if @page.page_integration.update(page_integration_params)
      redirect_to page_url(@page), notice: "Page was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /pages/1
  def destroy
    @page.destroy

    redirect_to pages_url, notice: "Page was successfully destroyed."
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_page
    page_id = params[:id] || params[:page_id]
    @page = Page.find(page_id)
  end

  # Only allow a list of trusted parameters through.
  def page_params
    params.require(:page).permit(:slug, :published, :lock_code)
  end

  def page_appearance_params
    params.require(:page_appearance).permit(:theme, :font, :primary_color)
  end

  def page_contact_params
    params.require(:page_contact).permit(:display_public_email, :public_email, :display_public_phone, :public_phone, :public_phone_type, :main_contact_links)
  end

  def page_integration_params
    params.require(:page_integration).permit(:facebook_pixel, :google_analytics, :email_capture)
  end
end
