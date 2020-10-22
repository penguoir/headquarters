class PinsController < ApplicationController
  def pin
    @project = Project.find(params[:id])

    @pin = Pin.find_or_initialize_by(user: current_user, project: @project)
    @pin.pinned = true

    if @pin.save
      redirect_to @project, notice: 'Pinned project to dashboard'
    else
      redirect_to @project, alert: 'uh oh'
    end
  end

  def unpin
    @project = Project.find(params[:id])

    @pin = Pin.find_or_initialize_by(user: current_user, project: @project)
    @pin.pinned = false

    if @pin.save
      redirect_to @project, notice: 'Unpinned the project'
    else
      redirect_to @project, alert: 'uh oh'
    end
  end

  def pin_params
    params.require(:pin).permit(:user_id, :project_id)
  end
end
