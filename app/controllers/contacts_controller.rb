class ContactsController < ApplicationController

  def create
    @contact = Contact.new(contact_params)
    puts @contact
    @contact.request = request
    if @contact.deliver
      render json: {message: "Thank you for your Email, I will get back to you shortly!"}
    else
      render json: {message: "Error occured. Please try again!"}
    end
  
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :message)
  end

end
