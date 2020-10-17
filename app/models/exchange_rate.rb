class ExchangeRate < ApplicationRecord
  belongs_to :currency_from, class_name: 'Currency'
  belongs_to :currency_to, class_name: 'Currency'

  validates :currency_from, :currency_to, :rate, :inv_rate, presence: true
  validates :rate, numericality: { greater_than: 0.00 }
  validates :inv_rate, numericality: { greater_than: 0.00 }
end
