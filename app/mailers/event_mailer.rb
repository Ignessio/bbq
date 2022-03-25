class EventMailer < ApplicationMailer
  def subscription(subscription)
    @event = subscription.event
    @name = subscription.user_name
    @email = subscription.user_email

    mail to: @event.user.email, subject: default_i18n_subject(event: @event.title)
  end

  def comment(comment, email)
    @event = comment.event
    @comment = comment

    mail to: email, subject: default_i18n_subject(event: @event.title)
  end

  def photo(photo, email)
    @event = photo.event
    @photo = photo

    mail to: email, subject: default_i18n_subject(event: @event.title)
  end
end
