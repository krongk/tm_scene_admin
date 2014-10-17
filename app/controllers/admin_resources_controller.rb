class AdminResourcesController < ApplicationController
  before_action :set_admin_resource, only: [:show, :edit, :update, :destroy]

  # GET /admin_resources
  # GET /admin_resources.json
  def index
    @admin_resources = AdminResource.page(params[:page])
  end

  # GET /admin_resources/1
  # GET /admin_resources/1.json
  def show
  end

  # GET /admin_resources/new
  def new
    @admin_resource = AdminResource.new
  end

  # GET /admin_resources/1/edit
  def edit
  end

  # POST /admin_resources
  # POST /admin_resources.json
  def create
    @admin_resource = AdminResource.new(admin_resource_params)

    respond_to do |format|
      if @admin_resource.save
        format.html { redirect_to @admin_resource, notice: 'Admin resource was successfully created.' }
        format.json { render :show, status: :created, location: @admin_resource }
      else
        format.html { render :new }
        format.json { render json: @admin_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin_resources/1
  # PATCH/PUT /admin_resources/1.json
  def update
    respond_to do |format|
      if @admin_resource.update(admin_resource_params)
        format.html { redirect_to @admin_resource, notice: 'Admin resource was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_resource }
      else
        format.html { render :edit }
        format.json { render json: @admin_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_resources/1
  # DELETE /admin_resources/1.json
  def destroy
    @admin_resource.destroy
    respond_to do |format|
      format.html { redirect_to admin_resources_url, notice: 'Admin resource was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_resource
      @admin_resource = AdminResource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_resource_params
      params.require(:admin_resource).permit(:name, :asset, :asset_file_name, :assetfile_size, :asset_content_type)
    end
end
