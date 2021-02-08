class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]
  before_action :set_project

  load_and_authorize_resource

  def index
    @resources = Resource.all
  end

  def show
  end

  def new
    @resource = Resource.new(user: current_user, project: @project)
  end

  def edit
  end

  def create
    @resource = Resource.new(resource_params)

    if @resource.save
      redirect_to @resource, notice: 'Resource was successfully created.'
    else
      render :new
    end
  end

  def update
    if @resource.update(resource_params)
      redirect_to @resource, notice: 'Resource was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @resource.destroy
    redirect_to @project, notice: 'Resource was destroyed.'
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
    params.require(:resource).permit(
      :title, :content, :user_id, :project_id
    ).merge(
      :project_id => @project.id,
      :user_id => current_user.id
    )
  end
end
