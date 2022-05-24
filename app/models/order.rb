class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy

  monetize :amount_cents

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :address, presence: true

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :first_name, :last_name, :email, :address, :state, :id ],
    using: {
      tsearch: { prefix: true }
    }
end
