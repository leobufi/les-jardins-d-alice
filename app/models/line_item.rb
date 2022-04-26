class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  belongs_to :coffret, optional: true
  belongs_to :order, optional: true

  def total_price
    self.quantity.to_s.to_i * self.product.price.to_s.to_i
  end
end
