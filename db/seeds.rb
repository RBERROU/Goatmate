# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
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
  password: Faker::Internet.password(min_length: 6),
  owner: 1
)

owner2 = User.create!(
  email: Faker::Internet.email,
  password: Faker::Internet.password(min_length: 6),
  owner: 1
)

# Create 2 non-owners
non_owner1 = User.create!(
  email: Faker::Internet.email,
  password: Faker::Internet.password(min_length: 6),
  owner: 0
)

non_owner2 = User.create!(
  email: Faker::Internet.email,
  password: Faker::Internet.password(min_length: 6),
  owner: 0
)

puts "Creating goats..."

# Paths to your 10 unique goat images
image_paths = [
  'app/assets/images/goat1.jpg',
  'app/assets/images/goat2.jpg',
  'app/assets/images/goat3.jpg',
  'app/assets/images/goat4.jpg',
  'app/assets/images/goat5.jpg',
  'app/assets/images/goat6.jpg',
  'app/assets/images/goat7.jpg',
  'app/assets/images/goat8.jpg',
  'app/assets/images/goat9.jpg',
  'app/assets/images/goat10.jpg'
]

# Create 10 goats, 5 for each owner, with unique images
10.times do |i|
  goat = Goat.create!(
    name: Faker::Creature::Animal.unique.name,
    bio: Faker::Lorem.paragraph(sentence_count: 1),
    price_per_day: rand(10..30),
    user: i < 5 ? owner1 : owner2
  )
  goat.image.attach(io: File.open(Rails.root.join(image_paths[i])), filename: "goat#{i + 1}.jpg")
  # goat.image.attach(io: File.open(image_paths[i]), filename: "goat#{i + 1}.jpg")
end

puts "Creating bookings..."

# Create 3 bookings on different goats

rent_start = Faker::Date.between(from: 2.days.ago, to: Date.today)

Booking.create!(
  goat: Goat.all.sample,
  user: non_owner1,
  total_price: rand(30..90),
  status: ['pending', 'approved', 'rejected'].sample,
  rent_start: rent_start,
  rent_end: Faker::Date.between(from: rent_start, to: rent_start + 4.days)
)

Booking.create!(
  goat: Goat.all.sample,
  user: non_owner2,
  total_price: rand(30..90),
  status: ['pending', 'approved', 'rejected'].sample,
  rent_start: rent_start,
  rent_end: Faker::Date.between(from: rent_start, to: rent_start + 10.days)
)

Booking.create!(
  goat: Goat.all.sample,
  user: non_owner1,
  total_price: rand(30..90),
  status: ['pending', 'approved', 'rejected'].sample,
  rent_start: rent_start,
  rent_end: Faker::Date.between(from: rent_start, to: rent_start + 2.days)
)

puts "Seed data created!"
