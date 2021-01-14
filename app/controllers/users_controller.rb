class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @activities = PublicActivity::Activity
      .where(owner: @user)
      .where('created_at > ?', 7.days.ago)
    @resources = @user.resources.where('created_at > ?', 7.days.ago)
    @tasks = @user.tasks.where('created_at > ?', 7.days.ago)
  end

  def edit_parent
    @user = current_user
    @last_report = Date.today.prev_occurring(:friday).change(hour: 16)
  end

  def update_parent
    @user = current_user
    ps = params.require(:user).permit(:parent_email)

    if @user.update(ps)
      redirect_to @user, notice: "Parent's details changed."
      ReportMailer.with(user: @user).welcome_mail.deliver_later
    else
      render :edit_parent
    end
  end
end
