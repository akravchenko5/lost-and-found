# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'faker'

puts 'Cleaning database...'
Converstion.destroy_all
Item.destroy_all
User.destroy_all

ADDRESS = [
  'Schweigaardsgate 34C, Oslo',
  'Karl Johans gate 34, Oslo',
  'Paulus Plass 1C, Oslo',
  'Sofies Plass 3b, Oslo',
  'Akersgata 55, Oslo',
  'Lakkegata 32, Oslo',
  'Hertug Skules vei 6, Fredrikstad',
  'Henrik Ibsensgate 2, Oslo',
  'Akersbakken 2, Oslo',
  'Konowsgate 3, Oslo',
  'Oddahagen 5B, Stavanger',
]

CATEGORIES = [
  'Drill',
  'Garden',
  'Saw',
  'Hammer',
  'Painting tool',
  'Electrical tool',
  'Screwdrivers',
  'Cleaning tool',
  'Accessories',
  'Hand tool'
]



puts 'Creating users...'
users_attributes = [
  {
    first_name: 'Alex',
    last_name: 'Johnson',
    address: 'Schweigaardsgate 34C, Oslo',
    email: 'alex@gmail.com',
    password: '123456',
    phone_number: '47095092'
  },
  {
    first_name: 'Doris',
    last_name: 'Day',
    address: 'Karl Johans gate 34C, Oslo',
    email: 'doris@gmail.com',
    password: '123456',
    phone_number: '90028935'
  },
  {
    first_name: 'Jan',
    last_name: 'Olsen',
    address: 'Paulus Plass 1C, Oslo',
    email: 'jan@gmail.com',
    password: '123456',
    phone_number: '90023550'
  },
  {
    first_name: 'Joanna',
    last_name: 'Jansson',
    address: 'Sofies Plass 3b, Oslo',
    email: 'joanna@gmail.com',
    password: '123456',
    phone_number: '99281054'
  },
  {
    first_name: 'Flo',
    last_name: 'Jackson',
    address: 'Akersgata 55, Oslo',
    email: 'flo@gmail.com',
    password: '123456',
    phone_number: '41541450',
  },
]
User.create!(users_attributes)


puts 'Creating tools...'

User.all.each do |user|
  5.times do
    file = URI.open('http://lorempixel.com/500/400/technics/')

    item = Item.new(
      name: Faker::Commerce.product_name,
      description: Faker::Hipster.paragraphs(number: 2).join(" "),
      price: rand(50..300),
      user: User.all.sample,
      category: CATEGORIES.sample,
      address: user.address
    )

    item.photo.attach(io: file, filename: "#{Faker::Commerce.product_name}.png", content_type: 'image/png')
    item.save!
  end

end


puts 'Finished!'
