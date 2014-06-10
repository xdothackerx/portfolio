class ContactController < ApplicationController

  def contact
    @contact = Contact.new
  end

  def message
    @contact = Contact.new(contact_params)
    if @contact.save
      UserMailer.contact(contact_params).deliver
      redirect_to root_path
      flash[:notice] = "Your email has been sent. Talk to you soon!"
    else
      render :contact
      flash[:alert] = "Something went wrong! Did you fill out all of the fields?"
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :email, :message)
    end
end
