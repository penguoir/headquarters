class ReportMailer < ApplicationMailer
  def welcome_mail
    @user = params[:user]
    mail to: @user.parent_email, subject: "#{@user.display_name.possessive} school report."
  end

  def report_mail
    @user = params[:user]
    @resources = @user.resources.where('created_at > ?', 7.days.ago)
    @activities = PublicActivity::Activity
      .where(owner: @user)
      .where('created_at > ?', 7.days.ago)

    mail to: @user.parent_email, subject: "Weekly report for #{@user.display_name}"
  end

  def send_reports
    puts "Sending reports"

    User.all.each do |u|
      ReportMailer.with(user: u).report_mail.deliver_later
    end
  end
end
