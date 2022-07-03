class ContentItemsController < ApplicationController
  before_action :set_page
  before_action :set_content_item, only: %i[ show edit update destroy reorder_link ]

  # GET /content_items or /content_items.json
  def index
    @content_items = @page.content_items.ordered
  end

  # GET /content_items/1 or /content_items/1.json
  def show
  end

  # GET /content_items/new
  def new
    @content_item = @page.content_items.new
  end

  # GET /content_items/1/edit
  def edit
  end

  # POST /content_items or /content_items.json
  def create
    @content_item = @page.content_items.new(content_item_params)

    respond_to do |format|
      if @content_item.save
        format.html { redirect_to page_content_item_url(@page, @content_item), notice: "Content item was successfully created." }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /content_items/1
  def update
    respond_to do |format|
      if @content_item.update(content_item_params)
        format.html { redirect_to page_content_item_url(@page, @content_item), notice: "Content item was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /content_items/1
  def destroy
    @content_item.destroy

    respond_to do |format|
      format.html { redirect_to page_content_items_url, notice: "Content item was successfully destroyed." }
      format.turbo_stream
    end
  end

  # PATCH /content_items/reorderLink
  def reorder_link
    destination = params[:destination]
    respond_to do |format|
      if @content_item.update_position(destination)
        format.json { head :ok }
      else
        format.json { head :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_content_item
    @content_item = @page.content_items.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def content_item_params
    params.require(:content_item).permit(:url, :title, :subtitle, :embedded, :highlight, :custom_thumbnail, :custom_thumbnail_image, :schedule, :schedule_date)
  end
end
