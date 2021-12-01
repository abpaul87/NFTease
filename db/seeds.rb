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

Nft.delete_all
Gallery.delete_all
User.delete_all
puts "deleting..."

new_user = User.create(
    email: 'test@test.com',
    password: 'test1234',
    wallet: '0x96ff1d6b5e9ca15f9e61b7e2130599005144fb28'
  )
new_user.save
puts "Completing users..."
puts new_user

puts "starting gallery creation..."

gallery = Gallery.new(
  user: new_user,
  name: new_user.wallet,
  selectors: {sdff: "dafds", erew: "eiwore"}
)
gallery.save
puts "finished gallery creation..."
puts gallery

puts 'Starting openseas api call...'

url = URI('https://api.opensea.io/api/v1/assets?format=json&limit=20&offset=0&order_direction=desc&owner=0x96ff1d6b5e9ca15f9e61b7e2130599005144fb28')
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
request = Net::HTTP::get(url)
response = JSON.parse(request)
response['assets'].each do |asset|
  # if asset['id'] == Nft.where(user: new_user).opensea_id
  #   nft = Nft.where(user: new_user).where(opensea_id: asset['id'])
  #   new_nft = nft.update(current_owner: asset.dig('owner', 'address'), token_metadata: asset)
  #   new_nft.save
  # else
    nft = Nft.new(
      opensea_id: asset['id'],
      token_name: asset['name'],
      token_description: asset['description'],
      collection_name: asset.dig('collection', 'name'),
      collection_description: asset.dig('collection', 'description'),
      artist_name: asset.dig('creator', 'user', 'username'),
      image_url: asset['image_original_url'],
      animation_url: asset['animation_original_url'],
      current_owner: asset.dig('owner', 'address'),
      token_metadata: asset,
      image_url_small: asset['image_preview_url'],
      opensea_link: asset['permalink'],
      gallery: gallery,
      user: new_user
    )
    nft.save
  # end
end

puts 'Finished OpenSea API Call...'

# puts nft

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
