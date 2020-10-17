class Currency < ApplicationRecord
  has_many :currency_from_exchanges, class_name: 'ExchangeRate', foreign_key: 'currency_from_id'
  has_many :currency_to_exchanges, class_name: 'ExchangeRate', foreign_key: 'currency_to_id'

  validates :code, :name, :country, :flag, presence: true
  validates :code, length: { is: 3 }
  validates :symbol, length: { maximum: 3 }
  validates :country, length: { in: 3..20 }
  validates :flag, length: { in: 1..20 }
end
