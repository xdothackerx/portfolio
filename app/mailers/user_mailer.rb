class UserMailer < ActionMailer::Base

  def contact(name, email, message)
    @name = name
    @email = email
    @message = message
    mail(to: "xdothackerx@gmail.com", subject: "Someone contacted me from samcamus.com!")
  end
end
