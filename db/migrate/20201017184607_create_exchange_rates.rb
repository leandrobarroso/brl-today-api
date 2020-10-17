class CreateExchangeRates < ActiveRecord::Migration[6.0]
  def change
    create_table :exchange_rates do |t|
      t.references :currency_from, null: false
      t.references :currency_to, null: false
      t.decimal :rate
      t.decimal :inv_rate

      t.timestamps
    end
  end
end
