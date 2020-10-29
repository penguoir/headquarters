# Preview all emails at http://localhost:3000/rails/mailers/report_mailer
class ReportMailerPreview < ActionMailer::Preview
  def welcome_mail
    ReportMailer.with(user: User.first).welcome_mail
  end

  def report_mail
    ReportMailer.with(user: User.first).report_mail
  end
end
