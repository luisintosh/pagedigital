class PageIntegrationsController < ApplicationController
  before_action :set_page_integration, only: %i[edit update]

  # GET /page/1/page_integrations/edit
  def edit
  end

  # PATCH/PUT /page/1/page_integrations
  def update
    if @page_integration.update(page_integration_params)
      redirect_to page_page_integration_url(@page_integration.page), notice: "Page integration was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_page_integration
    @page_integration = @page.page_integration
  end

  # Only allow a list of trusted parameters through.
  def page_integration_params
    params.require(:page_integration).permit(:facebook_pixel, :google_analytics, :email_capture)
  end
end
