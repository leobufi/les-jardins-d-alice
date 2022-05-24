# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview

  def client_confirmation
    OrderMailer.with(order: @order).client_confirmation.deliver_now
  end

  def alice_confirmation
    OrderMailer.with(order: @order).alice_confirmation.deliver_now
  end
end
