class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy

  monetize :amount_cents

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :address, presence: true
end
