class HomeController < ApplicationController
  def index
  end

  def contact
  end

  def message
    name = params[:name]
    email = params[:email]
    message = params[:message]
    if name.empty? || email.empty? || message.empty?
      redirect_to "/contact", alert: "Something went wrong! Did you fill out all of the fields?"
    else
      UserMailer.contact(name, email, message).deliver
      redirect_to root_path, notice: "Your email has been sent. Talk to you soon!"
    end
  end
end
