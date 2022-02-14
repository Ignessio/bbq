class CommentsController < ApplicationController
  before_action :set_event, only: %i[create destroy]
  before_action :set_comment, only: [:destroy]

  def create
    @new_comment = @event.comments.build(comment_params)
    @new_comment.user = current_user

    if @new_comment.save
      redirect_to @event, notice: t('.created')
    else
      render 'events/show', alert: t('.error')
    end
  end

  def destroy
    message = { notice: t('.deleted') }

    if current_user_cat_edit?(@comment)
      @comment.destroy!
    else
      message = { alert: t('.error') }
    end

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
end
