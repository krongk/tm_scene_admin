class PageTemplatesController < ApplicationController
  before_action :set_page_template, only: [:show, :edit, :update, :destroy]

  # GET /page_templates
  # GET /page_templates.json
  def index
    @page_templates = PageTemplate.all
  end

  # GET /page_templates/1
  # GET /page_templates/1.json
  def show
  end

  # GET /page_templates/new
  def new
    @page_template = PageTemplate.new
  end

  # GET /page_templates/1/edit
  def edit
  end

  # POST /page_templates
  # POST /page_templates.json
  def create
    @page_template = PageTemplate.new(page_template_params)

    respond_to do |format|
      if @page_template.save
        format.html { redirect_to @page_template, notice: 'Page template was successfully created.' }
        format.json { render :show, status: :created, location: @page_template }
      else
        format.html { render :new }
        format.json { render json: @page_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /page_templates/1
  # PATCH/PUT /page_templates/1.json
  def update
    respond_to do |format|
      if @page_template.update(page_template_params)
        format.html { redirect_to @page_template, notice: 'Page template was successfully updated.' }
        format.json { render :show, status: :ok, location: @page_template }
      else
        format.html { render :edit }
        format.json { render json: @page_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /page_templates/1
  # DELETE /page_templates/1.json
  def destroy
    @page_template.destroy
    respond_to do |format|
      format.html { redirect_to page_templates_url, notice: 'Page template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page_template
      @page_template = PageTemplate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_template_params
      params.require(:page_template).permit(:title, :preview_image, :html)
    end
end
