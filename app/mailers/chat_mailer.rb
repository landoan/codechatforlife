class ChatMailer < ApplicationMailer
  default from: "admin@codechatforlife.com"

  def send_message_email( message, recipient )
    @message = message
    @recipient = recipient
    mail(to: recipient.email, subject: '[Code Chat For Life] Message from ' + message.user.name)

  end

  def read_message_email( message, reader)
    @message = message
    @reader = reader
    mail(to: message.user.email, subject: '[Code Chat For Life] Notification - Your message has been read')
  end
end
