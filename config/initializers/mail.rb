ActionMailer::Base.smtp_settings =  {
  address: 'mail.messagingengine.com',
  authentication: :plain,
  domain: 'fastmail.fm',
  enable_starttls_auto: false,
  password: ENV['SMTP_PASS'],
  port: 465,
  ssl: true,
  user_name: ENV['SMTP_USER']
}
