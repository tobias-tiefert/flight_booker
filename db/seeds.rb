# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Airport.destroy_all
Flight.destroy_all

muc = Airport.create!(code: "MUC")
ber = Airport.create!(code: "BER")
ham = Airport.create!(code: "HAM")

airports = [ muc, ber, ham ]

30.times do |day_offset|
  date = Date.today + day_offset

  airports.permutation(2).each do |from, to|
    3.times do
      Flight.create!(
        departure_airport: from,
        arrival_airport: to,
        start_datetime: Time.zone.parse("#{date} #{rand(6..20)}:#{rand(0..59)}"),
        duration: rand(45..90)
      )
    end
  end
end
