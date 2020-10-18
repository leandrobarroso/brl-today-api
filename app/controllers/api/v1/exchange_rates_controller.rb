class Api::V1::ExchangeRatesController < ApplicationController
  def index
    @exchange_rates = ExchangeRate.all
  end
end
