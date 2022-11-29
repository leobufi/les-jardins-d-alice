class OrderMailer < ApplicationMailer

  def client_confirmation
    @order = params[:order]
    mail(
        to: @order.email,
        from: "lesjardinsdalice@outlook.fr",
        subject: "Votre commande aux Jardins d\'Alice a bien été prise en compte"
      )
  end

  def alice_confirmation
    @order = params[:order]
    mail(
      to: "lesjardinsdalice@outlook.fr",
      from:"lesjardinsdalice@outlook.fr",
      subject: "Nouvelle commande ! N°#{@order.id}"
    )
  end
end
