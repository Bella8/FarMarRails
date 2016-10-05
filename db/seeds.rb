# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

CSV.read('./seed_csvs/markets.csv').each do |line|
  Market.create(id: line[0], name: line[1], address: line[2], city: line[3], county: line[4], state: line[5], zip: line[6])
end
# CSV.read('./seed_csvs/products.csv').each do |line|
#   Market.create(id: line[0], name: line[1], address: line[2], city: line[3], state: line[4], zip: line[5])
# end
# CSV.read('./seed_csvs/markets.csv').each do |line|
#   Market.create(id: line[0], name: line[1], address: line[2], city: line[3], state: line[4], zip: line[5])
# end
# CSV.read('./seed_csvs/markets.csv').each do |line|
#   Market.create(id: line[0], name: line[1], address: line[2], city: line[3], state: line[4], zip: line[5])
# end
