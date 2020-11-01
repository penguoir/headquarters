class ChatChannel < ApplicationCable::Channel
  def subscribed
    return unless params[:project_id].present?

    project = Project.find(params[:project_id])
    stream_for project
  end
end
