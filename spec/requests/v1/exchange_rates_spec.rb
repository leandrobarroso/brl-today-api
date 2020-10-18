require 'rails_helper'

RSpec.describe 'Todos API', type: :request do
  # initialize test data
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
