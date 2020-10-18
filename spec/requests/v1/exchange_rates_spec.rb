require 'rails_helper'

RSpec.describe 'Todos API', type: :request do
  # initialize test data
  let!(:exchange) { create(:exchange_rate) }

  # Test context for GET /exchange_rates
  describe 'GET /exchange_rates' do
    # make HTTP get request before each example
    before { get '/v1/exchange_rates' }

    it 'returns exchange rates' do
      expect(json).not_to be_empty
      expect(json.size).to eq(ExchangeRate.all.size)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
