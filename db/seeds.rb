# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

require 'open-uri'

puts 'starting deletion'
Like.destroy_all
Nft.destroy_all
Gallery.destroy_all
User.destroy_all
puts "deleting..."

new_user1 = User.create(
  email: 'test1@test.com',
  password: 'test1234',
  wallet: '0x96ff1d6b5e9ca15f9e61b7e2130599005144fb28'
)
new_user1.save

new_user2 = User.create(
  email: 'test2@test.com',
  password: 'test1234',
  wallet: '0x0f0eae91990140c560d4156db4f00c854dc8f09e'
)
new_user2.save

new_user3 = User.create(
  email: 'test3@test.com',
  password: 'test1234',
  wallet: '0x88d3574660711e03196af8a96f268697590000fa'
)
new_user3.save

new_user4 = User.create(
  email: 'test4@test.com',
  password: 'test1234',
  wallet: '0xd6406c9838e1423d14a6dfc1bfd6a1c307608da3'
)
new_user4.save

new_user5 = User.create(
  email: 'test5@test.com',
  password: 'test1234',
  wallet: '0x3295df41a2f288da03818ae32565e1599f1b2eee'
)
new_user5.save

new_user6 = User.create(
  email: 'test6@test.com',
  password: 'test1234',
  wallet: '0xebf229e55270dfd60fa6b104a1adc187ac8be43b'
)
new_user6.save

new_user7 = User.create(
  email: 'test7@test.com',
  password: 'test1234',
  wallet: '0xdda8c71017afde4c65e7bcfbd4864ce613dc8e7c'
)
new_user7.save

new_user8 = User.create(
  email: 'test8@test.com',
  password: 'test1234',
  wallet: '0xfd22004806a6846ea67ad883356be810f0428793'
)
new_user8.save

new_user9 = User.create(
  email: 'test9@test.com',
  password: 'test1234',
  wallet: '0xc46db2d89327d4c41eb81c43ed5e3dff111f9a8f'
)
new_user9.save

new_user10 = User.create(
  email: 'test10@test.com',
  password: 'test1234',
  wallet: '0x8dbbca57ea56290efa14d835bbfd34faf1d89753'
)
new_user10.save

puts "Completing users..."

puts "starting gallery creation..."

# gallery = Gallery.new(
#   user: new_user,
#   name: new_user.wallet
# )
# gallery.save
# puts "finished gallery creation..."
# puts gallery

users = User.all

puts 'Starting openseas api call...'

users.each do |user|
  gallery = Gallery.new(
    user: user,
    name: user.wallet
  )
  gallery.save
  url = URI("https://api.opensea.io/api/v1/assets?format=json&limit=20&offset=0&order_direction=asc&owner=#{user.wallet}")
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  request = Net::HTTP::get(url)
  response = JSON.parse(request)
  order = 1
  response['assets'].each do |asset|
    sale = 0
    if asset['sell_orders'].nil?
      sale = false
    else
      sale = true
    end
    nft = Nft.new(
      opensea_id: asset['id'],
      token_name: asset['name'],
      token_description: asset['description'],
      collection_name: asset.dig('collection', 'name'),
      collection_description: asset.dig('collection', 'description'),
      artist_name: asset.dig('creator', 'user', 'username') || asset.dig('collection', 'name'),
      image_url: asset['image_url'] || "https://res.cloudinary.com/jansommer/image/upload/v1638530952/nftease/no-image.png",
      animation_url: asset['animation_original_url'],
      current_owner: asset.dig('owner', 'address'),
      token_metadata: asset,
      image_url_small: asset['image_preview_url'] || "https://res.cloudinary.com/jansommer/image/upload/v1638530952/nftease/no-image.png",
      opensea_link: asset['permalink'],
      gallery: gallery,
      user: user,
      gallery_order: order,
      forsale: sale
    )
    nft.save
    order += 1
  end
end

puts 'Finished OpenSea API Call...'
