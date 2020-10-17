# Test suite for the ExchangeRate model
require 'rails_helper'

RSpec.describe ExchangeRate, type: :model do
  # Validation tests
  # ensure columns name, age, gender, location and infected are present before saving
  it { should validate_presence_of(:currency_from) }
  it { should validate_presence_of(:currency_to) }
  it { should validate_presence_of(:rate) }
  it { should validate_presence_of(:inv_rate) }

  # ensure numericality validation of columns rate and inv_rate
  it { should validate_numericality_of(:rate).is_greater_than(0.00) }
  it { should validate_numericality_of(:inv_rate).is_greater_than(0.00) }
end
