puts 'seeding DB...'
puts 'creating currencies'

data = [
  {
    code: 'BRL',
    symbol: 'R$',
    name: 'Brazilian Real',
    country: 'Brazil',
    flag: '&#127463;&#127479;'
  },
  {
    code: 'USD',
    symbol: '$',
    name: 'US Dollar',
    country: 'USA',
    flag: '&#127482;&#127480;'
  },
  {
    code: 'EUR',
    symbol: '€',
    name: 'Euro',
    country: 'European Union',
    flag: '&#127466;&#127482;'
  },
  {
    code: 'JPY',
    symbol: '¥',
    name: 'Japanese Yen',
    country: 'Japan',
    flag: '&#127471;&#127477;'
  },
  {
    code: 'GBP',
    symbol: '£',
    name: 'Pounds Sterling',
    country: 'United Kingdom',
    flag: '&#127468;&#127463;'
  },
  {
    code: 'AUD',
    symbol: 'A$',
    name: 'Australian Dollar',
    country: 'Australia',
    flag: '&#127462;&#127482;'
  },
  {
    code: 'CAD',
    symbol: 'C$',
    name: 'Canadian Dollar',
    country: 'Canada',
    flag: '&#127464;&#127462;'
  }
]

data.each do |attributes|
  currency = Currency.new(
    code: attributes[:code],
    symbol: attributes[:symbol],
    name: attributes[:name],
    country: attributes[:country],
    flag: attributes[:flag]
  )
  currency.save!
  puts currency.name
end
puts 'currencies created!'
puts 'done'
