FactoryBot.define do
  factory :exchange_rate do
    currency_from { create(:currency) }
    currency_to { create(:currency) }
    rate { 0.18 }
    inv_rate { 5.60 }
    update_time { 'Tue, 20 Oct 2020 00:04:09 +0000' }
  end
end
