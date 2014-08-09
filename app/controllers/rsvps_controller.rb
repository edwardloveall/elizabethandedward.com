class RsvpsController < ApplicationController
  skip_before_filter :require_login

  def edit
    @invite = find_invite.decorate
    if @invite
      @people = @invite.people
    else
      redirect_to root_path
    end
  end

  def add_plus_one
    invite = find_invite
    @person = invite.add_plus_one
    invite.update(plus_one_at: Time.zone.now)
    render @person
  end

  private

  def find_invite
    Invite.find_by(token: params[:id])
  end
end
