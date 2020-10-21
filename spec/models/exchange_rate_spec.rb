# Test suite for the ExchangeRate model
require 'rails_helper'

RSpec.describe ExchangeRate, type: :model do
  # ensure model has a valid factory
  it "has a valid factory" do
    expect(create(:exchange_rate)).to be_valid
  end

  # Validation tests
  # ensure columns name, age, gender, location and infected are present before saving
  it { should validate_presence_of(:currency_from) }
  it { should validate_presence_of(:currency_to) }
  it { should validate_presence_of(:rate) }
  it { should validate_presence_of(:inv_rate) }

  # ensure numericality validation of columns rate and inv_rate
  it { should validate_numericality_of(:rate).is_greater_than(0.00) }
  it { should validate_numericality_of(:inv_rate).is_greater_than(0.00) }

  # Class methods tests
  describe '#update_rates' do
    context "responds to update_rates method" do
      let!(:exchange) { create(:exchange_rate) }
      it { expect(ExchangeRate).to respond_to(:update_rates) }
    end
    # context "executes update_rates correctly" do
    #   let!(:exchange) { create(:exchange_rate) }
    #   it "'should update rates from all currencies'"
    #       expect(exchange.update_rates).to eq(true)
    # end
  end
end
