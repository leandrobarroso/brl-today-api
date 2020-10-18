FactoryBot.define do
  factory :exchange_rate do
    currency_from { create(:currency_from) }
    currency_to { create(:currency_to) }
    rate { 0.18 }
    inv_rate { 5.60 }
  end
end
