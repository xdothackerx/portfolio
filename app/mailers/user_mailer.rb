class UserMailer < ActionMailer::Base

  def contact(params)
    mail(to: "xdothackerx@gmail.com", subject: "Someone contacted me from samcamus.com!")
  end
end
