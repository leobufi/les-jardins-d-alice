class CoffretOnDemand < ApplicationRecord
    has_many :products
    has_many :line_items, dependent: :destroy
  
    serialize :products, Array
  
    monetize :price_cents
  
    validates :price_cents, presence: true
    validates :price_currency, presence: true
    validates :products, presence: true

    # before_save :calculate_price

    # private
  
    # def calculate_price
    #   total_price = self.products.sum(:price_cents)
    #   self.price_cents = total_price
    # end
end
