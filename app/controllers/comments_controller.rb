class CommentsController < ApplicationController
  before_action :set_event, only: %i[create destroy]
  before_action :set_comment, only: :destroy

  after_action :verify_authorized

  def create
    @new_comment = @event.comments.build(comment_params)
    @new_comment.user = current_user

    authorize @new_comment

    if @new_comment.save
      notify_new_comment(@new_comment)

      redirect_to @event, notice: t('.created')
    else
      render 'events/show', alert: t('.error')
    end
  end

  def destroy
    authorize @comment

    message = { notice: t('.deleted') }

    @comment.destroy!

    redirect_to @event, message
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_comment
    @comment = @event.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :user_name)
  end

  def notify_new_comment(comment)
    all_emails = (comment.event.subscriptions.map(&:user_email) + [comment.event.user.email] - [comment.user&.email]).uniq

    all_emails.each do |mail|
      EventMailer.comment(comment, mail).deliver_now
    end
  end
end
