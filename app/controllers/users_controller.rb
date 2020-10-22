class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @activities = PublicActivity::Activity
      .where(owner: @user)
      .where('created_at > ?', 7.days.ago)
    @resources = @user.resources.where('created_at > ?', 7.days.ago)
  end
end
