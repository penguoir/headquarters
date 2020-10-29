class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @activities = PublicActivity::Activity
      .where(owner: @user)
      .where('created_at > ?', 7.days.ago)
    @resources = @user.resources.where('created_at > ?', 7.days.ago)
  end

  def edit_parent
    @user = current_user
  end

  def update_parent
    @user = current_user
    ps = params.require(:user).permit(:parent_email)

    if @user.update(ps)
      redirect_to @user, notice: "Parent's details changed."
    else
      render :edit_parent
    end
  end
end
