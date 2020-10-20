class ExchangeRate < ApplicationRecord
  belongs_to :currency_from, class_name: 'Currency'
  belongs_to :currency_to, class_name: 'Currency'

  validates :currency_from, :currency_to, :rate, :inv_rate, presence: true
  validates :rate, numericality: { greater_than: 0.00 }
  validates :inv_rate, numericality: { greater_than: 0.00 }

  def self.update_rates
    exchange_rates = ExchangeRateApiServices::StandardEndpoint.new('BRL').call
    currencies = Currency.all
    currencies.each do |currency|
      rate = ExchangeRate.new(
        currency_from: Currency.find_by(code: exchange_rates['base_code']),
        currency_to: Currency.find_by(code: currency.code),
        rate: exchange_rates['conversion_rates'][currency.code],
        inv_rate: 1 / exchange_rates['conversion_rates'][currency.code],
        update_time: exchange_rates['time_last_update_utc']
      )
      rate.save!
    end
  end
end
