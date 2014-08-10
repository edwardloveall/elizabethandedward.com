class InvitesController < ApplicationController
  def index
    @invites = Invite.with_people_and_choices
  end

  def new
    @invite = Invite.new
  end

  def create
    @invite = Invite.new(invite_params)

    if @invite.save
      @invite.generate_token!
      Mailer.send_invite(@invite).deliver
      flash[:success] = 'Invite was sent'
      redirect_to new_invite_path
    end
  end

  private

  def invite_params
    params.require(:invite).permit(:email, :allow_plus_one, person_ids: [])
  end
end
