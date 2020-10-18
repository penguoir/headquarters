class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]
  before_action :set_project

  # GET /resources
  # GET /resources.json
  def index
    @resources = Resource.all
  end

  # GET /resources/1
  # GET /resources/1.json
  def show
  end

  # GET /resources/new
  def new
    @resource = @project.resources.new
  end

  # GET /resources/1/edit
  def edit
  end

  # POST /resources
  # POST /resources.json
  def create
    @resource = Resource.new(resource_params)
    @resource.user = current_user
    @resource.project = @project

    if @resource.save
      redirect_to @resource, notice: 'Resource was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /resources/1
  # PATCH/PUT /resources/1.json
  def update
    if @resource.update(resource_params)
      redirect_to @resource, notice: 'Resource was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resource.destroy
    redirect_to resources_url, notice: 'Resource was successfully destroyed.'
  end

  private

  def set_resource
    @resource = Resource.find(params[:id])
  end

  def set_project
    @project = @resource ? @resource.project : Project.find(params[:project_id])
  end

  # Only allow a list of trusted parameters through.
  def resource_params
    params.require(:resource).permit(:title, :user_id, :project_id)
  end
end
