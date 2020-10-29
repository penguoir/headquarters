class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@headquarters.com'
  layout 'mailer'
end
