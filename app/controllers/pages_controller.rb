class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :contact, :cgv]

  def home
  end

  def contact
    @contact = Contact.new
  end

  def cgv
  end

  private

  def order_params
    params.require(:order).permit(:first_name, :last_name, :email, :address, :state, :amount_cents, :checkout_session_id, :line_item_ids)
  end

end
