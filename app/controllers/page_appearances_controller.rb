class PageAppearancesController < ApplicationController
  before_action :set_page
  before_action :set_page_appearance, only: %i[edit update]

  # GET /page/1/page_appearances/edit
  def edit
  end

  # PATCH/PUT /page/1/page_appearances
  def update
    if @page_appearance.update(page_appearance_params)
      redirect_to edit_page_page_appearance_url(@page_appearance.page), notice: 'Appearance successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_page_appearance
    @page_appearance = @page.page_appearance
  end

  # Only allow a list of trusted parameters through.
  def page_appearance_params
    params.require(:page_appearance).permit(:theme, :font, :primary_color)
  end
end
