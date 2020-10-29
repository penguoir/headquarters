class ChatsController < ApplicationController
  before_action :set_project

  def index
    @chat = Chat.new
    @chats = Chat.where(project: @project).recent.limit(25)
  end

  def create
    @chat = Chat.new
    @chat.user = current_user
    @chat.project = @project
    @chat.body = params[:chat][:body]

    if @chat.save
      ChatChannel.broadcast_to(@project, {
        created_at: @chat.created_at.strftime('%b %d, %Y %H:%M:%S GMT'),
        body: @chat.body,
        display_name: current_user.display_name
      })
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def chat_params
    params.require(:chat).permit(:body)
  end
end
