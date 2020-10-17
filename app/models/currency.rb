class Currency < ApplicationRecord
  validates :code, :symbol, :name, :country, :flag, presence: true
end
