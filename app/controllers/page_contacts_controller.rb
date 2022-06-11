class PageContactsController < ApplicationController
  before_action :set_page_contact, only: %i[edit update]

  # GET /page/1/page_contacts/edit
  def edit
  end

  # PATCH/PUT /page/1/page_contacts
  def update
    if @page_contact.update(page_contact_params)
      redirect_to edit_page_page_contact_url(@page_contact.page), notice: "Page contact was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_page_contact
    @page_contact = Page.find_by!(slug: params[:page_slug]).page_contact
  end

  # Only allow a list of trusted parameters through.
  def page_contact_params
    params.require(:page_contact).permit(:display_public_email, :public_email, :display_public_phone, :public_phone, :public_phone_type, :main_contact_links)
  end
end
