class Mailer < ActionMailer::Base
  default from: 'edward@edwardloveall.com'

  def send_invite(invite)
    @invite = invite

    mail(to: @invite.email, subject: %q{Elizabeth and Edward Get Married})
  end
end
