class EventMailer < ApplicationMailer
  def subscription(event, subscription)
    @event = event
    @name = subscription.user_name
    @email = subscription.user_email

    mail to: event.user.email, subject: "Новая подписка на #{event.title}"
  end

  def comment(event, comment, email)
    @event = event
    @comment = comment

    mail to: email, subject: "Новый комментарий к #{event.title}"
  end

  def photo(photo, email)
    @event = photo.event
    @photo = photo

    mail to: email, subject: "Новая картинка для #{@event.title}"
  end

end
