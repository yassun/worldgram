require "csv"

CountryName.delete_all
CSV.foreach('db/country_names.csv') do |row|
  CountryName.create(:jp=> row[0], :en => row[1])
end

