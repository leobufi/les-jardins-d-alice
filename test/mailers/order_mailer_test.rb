require "test_helper"

class OrderMailerTest < ActionMailer::TestCase

  def client_confirmation
    @order = Order.first
    mail(
        to: @order.email,
        from: "lesjardinsdalice@outlook.fr",
        subject: "Votre commande aux Jardins d\'Alice a bien été prise en compte"
      )
  end
end
