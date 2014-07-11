class UserMailer < ActionMailer::Base

  def contact(params)
    @name = params["name"]
    @email = params["email"]
    @message = params["message"]
    mail(to: "xdothackerx@gmail.com", subject: "Someone contacted me from samcamus.com!", from: "samcamus.com")
  end
end
