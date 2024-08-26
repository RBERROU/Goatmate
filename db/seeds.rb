# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

puts "Cleaning database..."
Booking.destroy_all
Goat.destroy_all
User.destroy_all

puts "Creating users..."

# Create 2 owners

owner1 = User.create!(
  email: Faker::Internet.email,
  password: "password",
  owner: 1
)

owner2 = User.create!(
  email: Faker::Internet.email,
  password: "password",
  owner: 1
)

# Create 2 non-owners
non_owner1 = User.create!(
  email: Faker::Internet.email,
  password: "password",
  owner: 0
)

non_owner2 = User.create!(
  email: Faker::Internet.email,
  password: "password",
  owner: 0
)

puts "Creating goats..."

# Create 10 goats, 5 for each owner
5.times do |i|
  Goat.create!(
    name: "#{Faker::Creature::Animal.name}_#{i}_#{SecureRandom.hex(3)}",
    bio: Faker::Lorem.paragraph(sentence_count: 2),
    price_per_day: rand(10..30),
    user: owner1
  )
end

5.times do |i|
  Goat.create!(
    name: "#{Faker::Creature::Animal.name}_#{i}_#{SecureRandom.hex(3)}",
    bio: Faker::Lorem.paragraph(sentence_count: 2),
    price_per_day: rand(10..30),
    user: owner2
  )
end

puts "Creating bookings..."

# Create 3 bookings on different goats
Booking.create!(
  goat: Goat.all.sample,
  user: non_owner1,
  total_price: rand(30..90),
  status: 'confirmed'
)

Booking.create!(
  goat: Goat.all.sample,
  user: non_owner2,
  total_price: rand(30..90),
  status: 'confirmed'
)

Booking.create!(
  goat: Goat.all.sample,
  user: non_owner1,
  total_price: rand(30..90),
  status: 'confirmed'
)

puts "Seed data created!"
