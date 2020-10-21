class AddUpdateTimeToExchangeRates < ActiveRecord::Migration[6.0]
  def change
    add_column :exchange_rates, :update_time, :string
  end
end
