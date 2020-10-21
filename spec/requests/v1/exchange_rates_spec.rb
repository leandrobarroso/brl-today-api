require 'rails_helper'

RSpec.describe 'BRL Today API', type: :request do
  # initialize test data
  let!(:real) { create(:currency) }
  let!(:dollar) {
    create(:currency, code: 'USD', symbol: '$', name: 'US Dollar', country: 'USA', flag: '&#127482;&#127480;')
  }
  let!(:euro) {
    create(:currency, code: 'EUR', symbol: '€', name: 'Euro', country: 'European Union', flag: '&#127466;&#127482;')
  }

  let!(:exchange_dollar) { create(:exchange_rate, currency_to: dollar) }
  let!(:exchange_euro) { create(:exchange_rate, currency_to: euro) }

  # Test context for GET /exchange_rates
  describe 'GET /exchange_rates' do
    # make HTTP get request before each example
    before { get '/api/v1/exchange_rates' }

    it 'returns exchange rates' do
      expect(json).not_to be_empty
      expect(json['exchange_rates'].size).to eq(ExchangeRate.all.size)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /exchange_rates/:currency_to_code' do
    context 'when the record exists' do
      # make HTTP get request before each example
      before { get "/api/v1/exchange_rates/USD" }
      it 'returns last BRL/USD exchange rate' do
        expect(json).not_to be_empty
        expect(json['currency_to']['code']).to eq('USD')
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context "when the record doesn't exist" do
      # make HTTP get request before each example
      before { get '/api/v1/exchange_rates/123abc' }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find ExchangeRate with/)
      end
    end
  end
end
