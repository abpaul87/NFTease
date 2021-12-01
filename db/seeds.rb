# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

User.delete_all
puts "deleting..."

new_user = User.create(
    email: 'test@test.com',
    password: 'test1234',
    wallet: '0x96ff1d6b5e9ca15f9e61b7e2130599005144fb28'
  )
new_user.save
puts "Completing seeds..."
puts new_user

# User.all.each do |user|
#   2.times do
#     offers = Offer.create(
#       item_name: Faker::Movie.title,
#       price: rand(5..20),
#       description: Faker::Lorem.paragraph,
#       image_url: "https://lorempixel.com/800/400/sports/#{rand(1..10)}/",
#       quantity: rand(1..5),
#       user_id: user.id
#     )
#     offers.save
#   end
# end
# users = User.all

# offer = Offer.create(
#       item_name: "Pizza Pouch",
#       price: 9.5,
#       description: "Ever need to carry a slice of pizza, but your hands are already occupied by another slice and a beer? This is the product for you.",
#       quantity: rand(1..5),
#       user_id: users.sample.id
#     )
# file = URI.open('https://images.firstwefeast.com/complex/image/upload/f_auto,fl_lossy,q_auto,w_1200/bmhtyz69tr7xoqphpyrj.jpg')
# offer.photo.attach(io: file, filename: 'pizza_pouch.png', content_type: 'image/png')
# offer.save
