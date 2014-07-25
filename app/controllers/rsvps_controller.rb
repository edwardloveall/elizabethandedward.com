class RsvpsController < ApplicationController
  def edit
    invite = Invite.find_by(token: params[:id])
    if invite
      @people = invite.people
    else
      redirect_to root_path
    end
  end
end
