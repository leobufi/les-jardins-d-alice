class LineItem < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :cart
  belongs_to :coffret_on_demand, optional: true
  belongs_to :coffret, optional: true
  belongs_to :order, optional: true

  def total_price
    if self.coffret_id
    self.quantity.to_s.to_i * self.coffret.price
    elsif self.coffret_on_demand_id
    self.quantity.to_s.to_i * self.coffret_on_demand.price
    elsif self.product.discount?
      self.quantity.to_s.to_i * self.product.price_with_discount
    elsif self.product_id
      self.quantity.to_s.to_i * self.product.price
    end
  end
end
