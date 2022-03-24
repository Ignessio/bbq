class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.dig(:google_smtp, :user_name)
  layout 'mailer'
end

