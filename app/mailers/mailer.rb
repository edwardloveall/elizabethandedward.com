class Mailer < ActionMailer::Base
  default from: 'edward@edwardloveall.com'

  def send_invite(invite)
    @invite = invite

    mail(to: @invite.email, subject: "You're invited to Elizabeth's and Edward's wedding!")
  end
end
