module ExchangeRateApiServices
  class StandardEndpoint < ApplicationService
    attr_reader :currency, :base_url

    def initialize(currency)
      @currency = currency
      @base_url = "https://v6.exchangerate-api.com/v6/#{ENV['EXCHANGE_RATE_API_KEY']}/latest/"
    end

    def call
      url = @base_url + @currency
      JSON.parse(RestClient.get url)
    end
  end
end
