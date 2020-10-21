class Api::V1::ExchangeRatesController < ApplicationController
  def index
    @exchange_rates = ExchangeRate.last_rates
  end

  def show
    @exchange_rate = ExchangeRate.where(currency_to: Currency.find_by(code: params[:currency_to])).last!
  end
end
