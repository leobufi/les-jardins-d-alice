class StripeCheckoutSessionService
  def call(event)
    @order = Order.find_by(checkout_session_id: event.data.object.id)
    @order.update(state: 'Payé !')
    OrderMailer.with(order: @order).client_confirmation.deliver_now
    OrderMailer.with(order: @order).alice_confirmation.deliver_now
  end
end
