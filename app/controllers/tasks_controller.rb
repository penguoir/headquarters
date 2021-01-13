class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :complete, :incomplete]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
    @project = Project.find(params[:id])
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @project = @task.project
  end

  # GET /tasks/new
  def new
    @task = Task.new
    @project = Project.find(params[:id]) || @task.project
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.project ||= Project.find(params[:id])

    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new 
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  # POST /tasks/1/complete
  def complete
    if @task.update(status: :complete)
      redirect_to tasks_path(@task.project), notice: 'Task marked as completed'
    end
  end

  # POST /tasks/1/complete
  def incomplete
    if @task.update(status: :incomplete)
      redirect_to tasks_path(@task.project), notice: 'Task marked as incompleted'
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      puts params
      params.require(:task).permit(:project_id, :title, :user_id, :due)
    end
end
