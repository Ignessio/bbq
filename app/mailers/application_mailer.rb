class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.dig(:mailjet, :sender_email)
  layout 'mailer'
end

