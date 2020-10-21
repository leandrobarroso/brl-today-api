json.exchange_rates @exchange_rates do |exchange_rate|
  json.(exchange_rate, :id)
  json.currency_from do
    json.code exchange_rate.currency_from['code']
    json.symbol exchange_rate.currency_from['symbol']
    json.name exchange_rate.currency_from['name']
    json.country exchange_rate.currency_from['country']
    json.flag exchange_rate.currency_from['flag']
  end
  json.currency_to do
    json.code exchange_rate.currency_to['code']
    json.symbol exchange_rate.currency_to['symbol']
    json.name exchange_rate.currency_to['name']
    json.country exchange_rate.currency_to['country']
    json.flag exchange_rate.currency_to['flag']
  end
  json.(exchange_rate, :rate, :inv_rate, :update_time)
end
