require 'rails_helper'

RSpec.describe 'Todos API', type: :request do
  # initialize test data
  data = [
    {
      code: 'BRL',
      symbol: 'R$',
      name: 'Brazilian Real',
      country: 'Brazil',
      flag: '&#127463;&#127479;'
    },
    {
      code: 'USD',
      symbol: '$',
      name: 'US Dollar',
      country: 'USA',
      flag: '&#127482;&#127480;'
    },
    {
      code: 'EUR',
      symbol: '€',
      name: 'Euro',
      country: 'European Union',
      flag: '&#127466;&#127482;'
    },
    {
      code: 'JPY',
      symbol: '¥',
      name: 'Japanese Yen',
      country: 'Japan',
      flag: '&#127471;&#127477;'
    },
    {
      code: 'GBP',
      symbol: '£',
      name: 'Pounds Sterling',
      country: 'United Kingdom',
      flag: '&#127468;&#127463;'
    },
    {
      code: 'AUD',
      symbol: 'A$',
      name: 'Australian Dollar',
      country: 'Australia',
      flag: '&#127462;&#127482;'
    },
    {
      code: 'CAD',
      symbol: 'C$',
      name: 'Canadian Dollar',
      country: 'Canada',
      flag: '&#127464;&#127462;'
    }
  ]
  let!(:exchange) { create(:exchange_rate) }

  # Test context for GET /exchange_rates
  describe 'GET /exchange_rates' do
    # make HTTP get request before each example
    before { get '/api/v1/exchange_rates' }

    it 'returns exchange rates' do
      expect(json).not_to be_empty
      expect(json.size).to eq(ExchangeRate.all.size)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /exchange_rates/:id' do
    context 'when the record exists' do
      # make HTTP get request before each example
      before { get "/api/v1/exchange_rates/#{exchange.id}" }
      it 'returns last exchange rate' do
        expect(json).not_to be_empty
        expect(json.size).to eq(1)
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
