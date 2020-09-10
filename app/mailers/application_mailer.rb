class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def message_email(email)
    @email = email
    @specialtext = `Hello! Thanks for sending me a message! I appreciate your support and time spent viewing my projects and other stuff about me! I'll respond to your message ASAP! 🥳 Thanks, Lee`
    mail(to: `email`), subject: "Hi Friend! Talk to ya soon"
  end

  def send_to_me(email_form)
    @email = email_form.email
    @specialtext = email_form.content
    mail(to: 'lzm0010@gmail.com', subject: `Message from #{@email}`)
  end
end
