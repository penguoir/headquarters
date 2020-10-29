class ChatChannel < ApplicationCable::Channel
  def subscribed
    puts params
    project = Project.find(params[:project_id])
    stream_for project
  end
end
