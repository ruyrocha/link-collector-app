class PageLinksController < ApplicationController
  before_action :set_page_link, only: %i[ show edit update destroy ]

  # GET /page_links or /page_links.json
  def index
    @page_links = PageLink.all
  end

  # GET /page_links/1 or /page_links/1.json
  def show
  end

  # GET /page_links/new
  def new
    @page_link = PageLink.new
  end

  # GET /page_links/1/edit
  def edit
  end

  # POST /page_links or /page_links.json
  def create
    @page_link = PageLink.new(page_link_params)

    respond_to do |format|
      if @page_link.save
        format.html { redirect_to page_link_url(@page_link), notice: "Page link was successfully created." }
        format.json { render :show, status: :created, location: @page_link }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @page_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /page_links/1 or /page_links/1.json
  def update
    respond_to do |format|
      if @page_link.update(page_link_params)
        format.html { redirect_to page_link_url(@page_link), notice: "Page link was successfully updated." }
        format.json { render :show, status: :ok, location: @page_link }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @page_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /page_links/1 or /page_links/1.json
  def destroy
    @page_link.destroy!

    respond_to do |format|
      format.html { redirect_to page_links_url, notice: "Page link was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page_link
      @page_link = PageLink.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def page_link_params
      params.require(:page_link).permit(:page_id, :title, :url)
    end
end
