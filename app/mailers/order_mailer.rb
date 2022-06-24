class OrderMailer < ApplicationMailer

  def client_confirmation
    @order = params[:order]
    mail(
        to: @order.email,
        from: "bufi.leo@gmail.fr",
        subject: "Votre commande aux Jardins d\'Alice a bien été prise en compte"
      )
  end

  def alice_confirmation
    @order = params[:order]
    mail(
      to: "bufi.leo@gmail.fr",
      from:"bufi.leo@gmail.fr",
      subject: "Nouvelle commande ! N°#{@order.id}"
    )
  end
end
