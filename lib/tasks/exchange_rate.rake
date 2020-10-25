namespace :exchange_rate do
  desc 'Updating all exchange rates with ExchangeRate-API'
  task update_rates: :environment do
    UpdateRatesJob.perform_later
  end
end
