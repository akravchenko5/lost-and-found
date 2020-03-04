d# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'faker'

puts 'Cleaning database...'
Conversation.destroy_all
Item.destroy_all
User.destroy_all

ADDRESS = [
  ,
  'Karl Johans gate 34, Oslo',
  'Paulus Plass 1C, Oslo',
  'Sofies Plass 3b, Oslo',
  'Akersgata 55, Oslo',
  'Lakkegata 32, Oslo',
  'Henrik Ibsensgate 2, Oslo',
  'Akersbakken 2, Oslo',
  'Konowsgate 3, Oslo',
  'Galgeberg 3F, 0657 Oslo',
  'Stjerneblokkveien 5, 1083 Oslo',
  'Mortensrudveien 38, 1283 Oslo',
  'Christoffer Hellums vei 29, 0950 Oslo',
  'Freserveien 21, 0195 Oslo',
  'Ensjøveien 21D, 0655 Oslo',
  'Smedgata 35A, 0651 Oslo',
  'Dronning Eufemias gate 65, 0194 Oslo',
  'Rubina Ranas gate 7, 0190 Oslo'
]

CATEGORIES = [
    'Animal/Pet',
    'Art',
    'Electronics',
    'Accessories',
    'Clothes',
    'Furnitures',
    'Sports',
    'Transportation',
    'Credit Card',
    'Phone',
    'Keys',
    'Wallet',
    'Other'
]


puts 'Creating users...'
users_attributes = [
  {
    first_name: 'Alex',
    last_name: 'Johnson',
    email: 'alex@gmail.com',
    password: '123456',
    phone_number: '47095092'
  },
  {
    first_name: 'Doris',
    last_name: 'Day',
    email: 'doris@gmail.com',
    password: '123456',
    phone_number: '90028935'
  },
  {
    first_name: 'Jan',
    last_name: 'Olsen',
    email: 'jan@gmail.com',
    password: '123456',
    phone_number: '90023550'
  },
  {
    first_name: 'Joanna',
    last_name: 'Jansson',
    email: 'joanna@gmail.com',
    password: '123456',
    phone_number: '99281054'
  },
  {
    first_name: 'Flo',
    last_name: 'Jackson',
    email: 'flo@gmail.com',
    password: '123456',
    phone_number: '41541450',
  },
]
User.create!(users_attributes)


puts 'Creating found items...'

items_attributes = [
  {
    title: 'Tittel inn her',
    description: 'Description inn her',
    state: 1,
    reward: 0,
    user: User.all.sample,
    category: 'Category inn her',
    address: 'Schweigaardsgate 34C, Oslo'
  },
]

Item.create!(items_attributes)


puts 'Creating lost items...'

items_attributes = [
  {
    title: 'Tittel inn her',
    description: 'Description inn her',
    state: 0,
    reward: 0,
    user: User.all.sample,
    category: 'Category inn her',
    address: 'Schweigaardsgate 34C, Oslo'
  },
]

Item.create!(items_attributes)



puts 'Finished!'
