class SubscriptionsController < ApplicationController
  before_action :set_event, only: %i[create destroy]
  before_action :set_subscription, only: :destroy

  after_action :verify_authorized

  def create
    @new_subscription = @event.subscriptions.build(subscription_params)
    @new_subscription.user = current_user

    authorize @new_subscription

    if @new_subscription.save
      EventMailer.subscription(@new_subscription).deliver_now

      redirect_to @event, notice: t('.created')
    else
      render 'events/show', alert: t('.error')
    end
  end

  def destroy
    authorize @subscription

    message = { notice: t('.deleted') }

    @subscription.destroy

    redirect_to @event, message
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_subscription
    @subscription = @event.subscriptions.find(params[:id])
  end

  def subscription_params
    params.fetch(:subscription, {}).permit(:user_email, :user_name)
  end
end
