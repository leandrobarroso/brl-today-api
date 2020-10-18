class Api::V1::ExchangeRatesController < ApplicationController
  def index
    @exchange_rates = ExchangeRate.all
  end

  def show
    @exchange_rate = ExchangeRate.find(params[:id])
  end
end
