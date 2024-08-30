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

owner1 = User.create!(
  email: Faker::Internet.email,
  password: Faker::Internet.password(min_length: 6),
  owner: 1
)

puts "Creating goats..."

Goat.create!(
  name: Faker::Creature::Animal.unique.name,
  bio: Faker::Lorem.paragraph(sentence_count: 1),
  price_per_day: rand(10..30),
  user: owner1
).tap do |goat|
  goat.image.attach(
    io: URI.open("https://images.unsplash.com/photo-1532633378163-24c2c0da3c99?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Z29hdHxlbnwwfHwwfHx8MA%3D%3D"),
    filename: "goat1.jpg"
  )
end

Goat.create!(
  name: Faker::Creature::Animal.unique.name,
  bio: Faker::Lorem.paragraph(sentence_count: 1),
  price_per_day: rand(10..30),
  user: owner2
).tap do |goat|
  goat.image.attach(
    io: URI.open("https://images.unsplash.com/photo-1524609864400-829f6a124032?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Z29hdHxlbnwwfHwwfHx8MA%3D%3D"),
    filename: "goat2.jpg"
  )
end

Goat.create!(
  name: Faker::Creature::Animal.unique.name,
  bio: Faker::Lorem.paragraph(sentence_count: 1),
  price_per_day: rand(10..30),
  user: non_owner1
).tap do |goat|
  goat.image.attach(
    io: URI.open("https://plus.unsplash.com/premium_photo-1664304299664-a8e2e2f80290?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Z29hdHxlbnwwfHwwfHx8MA%3D%3D"),
    filename: "goat3.jpg"
  )
end

Goat.create!(
  name: Faker::Creature::Animal.unique.name,
  bio: Faker::Lorem.paragraph(sentence_count: 1),
  price_per_day: rand(10..30),
  user: non_owner1
).tap do |goat|
  goat.image.attach(
    io: URI.open("https://images.unsplash.com/photo-1524024973431-2ad916746881?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Z29hdHxlbnwwfHwwfHx8MA%3D%3D"),
    filename: "goat4.jpg"
  )
end

Goat.create!(
  name: Faker::Creature::Animal.unique.name,
  bio: Faker::Lorem.paragraph(sentence_count: 1),
  price_per_day: rand(10..30),
  user: owner2
).tap do |goat|
  goat.image.attach(
    io: URI.open("https://images.unsplash.com/photo-1505038348242-eb3fde2b728c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8Z29hdHxlbnwwfHwwfHx8MA%3D%3D"),
    filename: "goat5.jpg"
  )
end

Goat.create!(
  name: Faker::Creature::Animal.unique.name,
  bio: Faker::Lorem.paragraph(sentence_count: 1),
  price_per_day: rand(10..30),
  user: owner1
).tap do |goat|
  goat.image.attach(
    io: URI.open("https://plus.unsplash.com/premium_photo-1667099521475-fcd0e941b4ab?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8Z29hdHxlbnwwfHwwfHx8MA%3D%3D"),
    filename: "goat6.jpg"
  )
end

Goat.create!(
  name: Faker::Creature::Animal.unique.name,
  bio: Faker::Lorem.paragraph(sentence_count: 1),
  price_per_day: rand(10..30),
  user: owner1
).tap do |goat|
  goat.image.attach(
    io: URI.open("https://images.unsplash.com/photo-1506076177893-89d54794ef41?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGdvYXR8ZW58MHx8MHx8fDA%3D"),
    filename: "goat7.jpg"
  )
end

Goat.create!(
  name: Faker::Creature::Animal.unique.name,
  bio: Faker::Lorem.paragraph(sentence_count: 1),
  price_per_day: rand(10..30),
  user: non_owner2
).tap do |goat|
  goat.image.attach(
    io: URI.open("https://images.unsplash.com/photo-1521916396286-3f65e9f0eddc?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGdvYXR8ZW58MHx8MHx8fDA%3D"),
    filename: "goat8.jpg"
  )
end

Goat.create!(
  name: Faker::Creature::Animal.unique.name,
  bio: Faker::Lorem.paragraph(sentence_count: 1),
  price_per_day: rand(10..30),
  user: non_owner2
).tap do |goat|
  goat.image.attach(
    io: URI.open("https://images.unsplash.com/photo-1516160211234-a32007ecfc2d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGdvYXR8ZW58MHx8MHx8fDA%3D"),
    filename: "goat9.jpg"
  )
end

Goat.create!(
  name: Faker::Creature::Animal.unique.name,
  bio: Faker::Lorem.paragraph(sentence_count: 1),
  price_per_day: rand(10..30),
  user: owner1
).tap do |goat|
  goat.image.attach(
    io: URI.open("https://images.unsplash.com/photo-1529763062018-cd9b9ede3a80?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjh8fGdvYXR8ZW58MHx8MHx8fDA%3D"),
    filename: "goat10.jpg"
  )
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
