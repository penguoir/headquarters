class ChatsController < ApplicationController
  before_action :set_project

  load_and_authorize_resource

  def index
    @chats = Chat.where(project: @project).recent.limit(25)

    @chat = Chat.new
  end

  def create
    @chat = Chat.new do |c|
      c.user = current_user
      c.project = @project
      c.body = params[:chat][:body]
    end

    if @chat.save
      ChatChannel.broadcast_to(@project, {
        created_at: @chat.created_at.strftime('%b %d, %Y %H:%M:%S GMT'),
        body: @chat.body,
        display_name: current_user.display_name
      })
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:body)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
