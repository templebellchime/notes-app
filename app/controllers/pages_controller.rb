class PagesController < ApplicationController
  before_action :set_notebook
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  # GET /pages
  # GET /pages.json
  def index
    @pages = @notebook.pages
  end

  # GET /pages/1
  # GET /pages/1.json
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
  # POST /pages.json
  def create
    @page = @notebook.pages.build(page_params)

    if @page.save
      redirect_to notebook_page_path(@notebook, @page), notice: 'Page was successfully created.' 
    else
      render :new 
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    if @page.update(page_params)
      redirect_to notebook_page_path(@notebook, @page), notice: 'Page was successfully updated.' 
    else
      render :edit
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    redirect_to @notebook, notice: 'Page was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_notebook
      @notebook = current_user.notebooks.find(params['notebook_id'])
    end

    def set_page
      @page = @notebook.pages.find(params[:id])
    end



    # Only allow a list of trusted parameters through.
    def page_params
      params.require(:page).permit(:title, :position, :notebook_id)
    end
end
