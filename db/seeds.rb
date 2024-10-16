# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
# Clear existing data

# Clear existing data
# Clear existing data
# Seed Owners

Favourite.destroy_all
Review.destroy_all
Car.destroy_all
Owner.destroy_all

puts 'Seeding owners...'
10.times do
  Owner.create!(
    nickname: Faker::Name.unique.first_name
  )
end

owners = Owner.all

# Seed Cars
puts 'Seeding cars...'
50.times do
  Car.create!(
    brand: Faker::Vehicle.make,
    model: Faker::Vehicle.model,
    year: rand(2000..2024), # Add a year within a realistic range
    fuel: Faker::Vehicle.fuel_type,
    owner: owners.sample
  )
end

cars = Car.all

# Seed Reviews
# puts 'Seeding reviews...'
# 100.times do
#   Review.create!(
#     comment: Faker::Lorem.sentence(word_count: 10),
#     rating: rand(1..5),
#     car: cars.sample
#   )
# end

# # Seed Favourites
# puts 'Seeding favourites...'
# 50.times do
#   Favourite.create!(
#     car: cars.sample
#   )
# end

# Fix: Change `owner.all` to `owners` to get the correct count of owners created
puts "Seeding completed! #{owners.count} owners created!"
