class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash[:notice] = 'Votre message a bien été envoyé! Je vous répondrais dès que possible.'
      redirect_to root_path
    else
      flash[:error] = 'Impossible d\'envoyer votre message'
      redirect_to prestation_categories_path
    end
  end
end
