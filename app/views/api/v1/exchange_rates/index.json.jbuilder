json.exchange_rates @exchange_rates do |exchange_rate|
  json.currency_from exchange_rate.currency_from['code']
  json.currency_to exchange_rate.currency_to['code']
  json.rate exchange_rate.rate
  json.inv_rate exchange_rate.inv_rate
  json.created_at exchange_rate.created_at
end
