FactoryBot.define do
  factory :currency_to, class: 'Currency' do
    code { 'BRL' }
    symbol { 'R$' }
    name { 'Brazilian Real'}
    country { 'Brazil' }
    flag { '&#127463;&#127479;' }
  end
  factory :currency_from, class: 'Currency' do
    code { 'USD' }
    symbol { '$' }
    name { 'US Dollar'}
    country { 'USA' }
    flag { '&#127482;&#127480;' }
  end
end
