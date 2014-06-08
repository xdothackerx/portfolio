class UserMailer < ActionMailer::Base

  def contact(name, email, message)
    @name = name
    @email = email
    @message = message
    @admin = User.find(1)
    mail(to: @admin.email, subject: "Someone contacted me from samcamus.com!")
  end
end
