FactoryBot.define do
  factory :currency, class: 'Currency' do
    code { 'BRL' }
    symbol { 'R$' }
    name { 'Brazilian Real'}
    country { 'Brazil' }
    flag { '&#127463;&#127479;' }
  end
end
