class LineItem < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :cart
  belongs_to :coffret, optional: true
  belongs_to :order, optional: true

  def total_price
    if self.product_id
      self.quantity.to_s.to_i * self.product.price.to_s.to_i
    elsif self.coffret_id
      self.quantity.to_s.to_i * self.coffret.price.to_s.to_i
    end
  end
end
