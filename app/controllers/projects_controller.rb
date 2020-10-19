class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def pinned
    @projects = Project.pinned_by(current_user)

    # TODO: find a better way to conditionally only render pinned
    @pinned = true
    render "index"
  end

  def show
    session[:return_to] ||= request.referer
  end

  def new
    @project = Project.new
    @project.pins.build(user: current_user)
  end

  def edit
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :show, status: :created, location: @project
    end
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def project_params
    input_params = params.require(:project).permit(
      :title,
      :pins_attributes => [
        :id,
        :pinned
      ]
    )

    input_params[:pins_attributes]["0"][:user_id] = current_user.id

    input_params
  end
end
