class PagesController < ApplicationController
  layout 'devise', only: %i[new create]
  before_action :set_page, only: %i[edit update destroy]

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
      redirect_to page_content_items_url(@page)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pages/1
  def update
    if @page.update(page_params)
      redirect_to edit_page_url(@page), notice: 'Your page has been updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /pages/1
  def destroy
    @page.destroy

    redirect_to pages_url, notice: 'Page successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_page
    @page = Page.find_by!(slug: params[:slug])
  end

  # Only allow a list of trusted parameters through.
  def page_params
    params.require(:page).permit(:slug, :published, :lock_code)
  end
end
