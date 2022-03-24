class EventMailer < ApplicationMailer
  def subscription
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  def comment
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
