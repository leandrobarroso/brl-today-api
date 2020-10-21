class UpdateRatesJob < ApplicationJob
  queue_as :default

  def perform
    # Do something later
    puts 'Calling #update_jobs...'
    ExchangeRate.update_rates
    puts 'Done!'
  end
end
