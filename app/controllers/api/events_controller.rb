module Api
  class EventsController < ApplicationController
    protect_from_forgery with: :null_session
    before_action :set_user, :set_event

    def create
      @event.attendees << @user
    end
    
    def destroy
      @event.attendees.destroy(@user)
    end

    private

    def set_user
      @user = User.find(params[:user_id])
    end
    
    def set_event
      @event = Event.find(event_params[:event_id])
    end

    def event_params
      params.permit :user_id, :event_id
    end
  end
end