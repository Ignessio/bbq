class EventsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_event, except: %i[index new create]
  before_action :authorize_event, only: %i[edit update destroy]

  after_action :verify_authorized, except: :index

  def index
    @events = Event.all
  end

  def show
    if params[:pincode].present? && @event.pincode_valid?(params[:pincode])
      cookies.permanent["events_#{@event.id}_pincode"] = params[:pincode]
    end

    begin
      authorize_event
    rescue Pundit::NotAuthorizedError
      flash.now[:alert] = t('.wrong_pincode') if params[:pincode].present?
      render 'password_form'
    end

    @new_comment = @event.comments.build(params[:comment])
    @new_subscription = @event.subscriptions.build(params[:subscription])
    @new_photo = @event.photos.build(params[:photo])
  end

  def new
    @event = current_user.events.build
    authorize_event
  end

  def edit
  end

  def create
    @event = current_user.events.build(event_params)
    authorize_event

    if @event.save
      redirect_to @event, notice: t('.created')
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: t('.updated')
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: t('.deleted')
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :address, :datetime, :description, :pincode)
  end

  def authorize_event
    authorize @event
  end
end
