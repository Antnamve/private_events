class InvitationsController < ApplicationController
  def create
    @invitation = Invitation.new(invitation_params)
    if @invitation.save
      redirect_to @invitation.event, notice: 'Invite'
    else
      #error
    end
  end

  def invitation_params
    params.require(:invitation).permit(:attendee_id, :attended_event_id)
  end
end