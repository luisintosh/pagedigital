class PageProfilesController < ApplicationController
  before_action :set_page_profile, only: %i[edit update]

  # GET /page/1/page_profiles/edit
  def edit
  end

  # PATCH/PUT /page/1/page_profiles/1
  def update
    if @page_profile.update(page_profile_params)
      redirect_to edit_page_page_profile_url(@page_profile.page), notice: "Page profile was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_page_profile
    @page_profile = Page.find_by!(slug: params[:page_slug]).page_profile
  end

  # Only allow a list of trusted parameters through.
  def page_profile_params
    params.require(:page_profile).permit(:display_name, :location, :description, :profile_image, :header_image)
  end
end
