class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy

  monetize :amount_cents

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :address, presence: true
  validates :data, presence: true
  PAYMENT_METHOD = {"Carte bleue": "0", "Chèque": "1"}

  enum payment_method: PAYMENT_METHOD

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :first_name, :last_name, :email, :address, :state, :id ],
    using: {
      tsearch: { prefix: true }
    }
end
