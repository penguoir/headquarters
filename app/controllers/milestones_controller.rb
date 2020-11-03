class MilestonesController < ApplicationController
  before_action :set_milestone, only: [:edit, :update, :destroy]

  load_and_authorize_resource

  def index
    @project = Project.find(params[:project_id])
    @milestones = Milestone.where(project: @project).with_rich_text_description
  end

  def new
    @project = Project.find(params[:id])
    @milestone = @project.milestones.new
  end

  def edit
  end

  def create
    @project = Project.find(params[:id])

    @milestone = Milestone.new(milestone_params)
    @milestone.project = @project

    if @milestone.save
      redirect_to @milestone, notice: 'Milestone was successfully created.'
    else
      render :new
    end
  end

  def update
    if @milestone.update(milestone_params)
      redirect_to project_milestones_path(@project), notice: 'Milestone was successfully updated.'
    else
      render :edit
    end
  end

  private

  def milestone_params
    params.require(:milestone).permit(:title, :date, :description)
  end

  def set_milestone
    @milestone = Milestone.find(params[:id])
    @project = @milestone.project
  end
end
