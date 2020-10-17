# Test suite for the Currency model
require 'rails_helper'

RSpec.describe Currency, type: :model do
  # Validation tests
  # ensure columns code, symbol, name, country and flag are present before saving
  it { should validate_presence_of(:code) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:country) }
  it { should validate_presence_of(:flag) }
end
