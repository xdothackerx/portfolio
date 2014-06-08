class HomeController < ApplicationController
  def index
  end

  def contact
  end

  def message
    name = params[:name]
    email = params[:email]
    message = params[:message]
    UserMailer.contact(name, email, message).deliver
    redirect_to root_path, notice: "Your email has been sent. Talk to you soon!"
  end
end
