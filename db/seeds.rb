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
# Create Romain user

romain = User.create!(
  email: "romain.a.berrou@gmail.com",
  password: "fakepass",
  owner: 1
)

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

owner1 = User.create!(
  email: Faker::Internet.email,
  password: Faker::Internet.password(min_length: 6),
  owner: 1
)

puts "User data created!"
