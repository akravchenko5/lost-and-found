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
  'Smedgata 35A, 0651 Oslo',
  'Galgeberg 3F, 0657 Oslo',
  'Karl Johans gate 34, Oslo',
  'Paulus Plass 1C, Oslo',
  'Sofies Plass 3b, Oslo',
  'Akersgata 55, Oslo',
  'Lakkegata 32, Oslo',
  'Henrik Ibsensgate 2, Oslo',
  'Akersbakken 2, Oslo',
  'Konowsgate 3, Oslo',
  'Stjerneblokkveien 5, 1083 Oslo',
  'Mortensrudveien 38, 1283 Oslo',
  'Christoffer Hellums vei 29, 0950 Oslo',
  'Freserveien 21, 0195 Oslo',
  'Ensjøveien 21D, 0655 Oslo',
  'Dronning Eufemias gate 65, 0194 Oslo',
  'Rubina Ranas gate 7, 0190 Oslo',
  'Rådhusgata 11, 0151 Oslo',
  'Trondheimsveien 8, 0560 Oslo',
  'Øvre Slottsgate 16, 0157 Oslo',
  'Oscars gate 81, 0256 Oslo',
  'Youngstorget 2, 0181 Oslo',
  'Møllergata 15, 0179 Oslo',
  'Stortingsgata 12, 0161 Oslo',
  'Helgesens gate 44, 0553 Oslo',
  'Ankerveien 127, 0766 Oslo'
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

puts 'Creating lost items...'

items_attributes = [
  {
    title: 'Knitted Wool Mittens',
    description: 'White mittens with red traditional decoration. I think I lost them close to the bus stop.',
    state: 0,
    reward: 50,
    user: User.all.sample,
    category: 'Clothes',
    address: 'Galgeberg 3F, 0657 Oslo'
  },

  {
    title: 'Smart Watch',
    description: "Lost it while running. It's black.",
    state: 0,
    reward: 200,
    user: User.all.sample,
    category: 'Electronics',
    address: 'Smedgata 35A, 0651 Oslo'
  },

  {
    title: 'Personal Diary - Generous Reward',
    description: 'Purple and black cover. It has a lot of written pages and is of great value to me. Please contact me if you have seen it!',
    state: 0,
    reward: 500,
    user: User.all.sample,
    category: 'Other',
    address: 'Karl Johans gate 34, Oslo'
  },
    {
    title: 'Credit Card',
    description: 'Lost my credit card last night at the pub.',
    state: 0,
    reward: 200,
    user: User.all.sample,
    category: 'Credit Card',
    address: 'Paulus Plass 1C, Oslo'
  },
    {
    title: 'Spider-Man Toy',
    description: 'Have you seen my sons Spider-Man?',
    state: 0,
    reward: 50,
    user: User.all.sample,
    category: 'Other',
    address: 'Youngstorget 2, 0181 Oslo'
  },
    {
    title: 'Yoga Mat',
    description: 'I had such a nice meditation that I completely forgot my orange yoga mat which was next to the bench when I left park. Any help is greatly appreciated. Namaste! ',
    state: 0,
    reward: 50,
    user: User.all.sample,
    category: 'Sports',
    address: 'Rådhusgata 11, 0151 Oslo'
  },
    {
    title: 'Big Bass Earbuds',
    description: 'Red and black earbuds. Lost on my way to school.'
    state: 0,
    reward: 20,
    user: User.all.sample,
    category: 'Category inn her',
    address: 'Sofies Plass 3b, Oslo'
  },
    {
    title: 'Zebra Piñata',
    description: "A big piñata that looks like a Zebra. It's for a birthday-party",
    state: 0,
    reward: 50,
    user: User.all.sample,
    category: 'Animal/Pet',
    address: 'Freserveien 21, 0195 Oslo'
  },
  {
    title: 'Black Leather Jacket',
    description: "I inherited it from my grandfather. Please return if found!",
    state: 0,
    reward: 800,
    user: User.all.sample,
    category: 'Clothes',
    address: 'Akersgata 55, Oslo'
  },
    {
    title: 'Ming Vase',
    description: 'White and blue vase from China with beautiful art decoration.',
    state: 0,
    reward: 700,
    user: User.all.sample,
    category: 'Art',
    address:  'Lakkegata 32, Oslo'
  },
    {
    title: 'White Labrador',
    description: "He's five years old and a very kind dog. Responds to Bobby. Please call the phone number on the collar.",
    state: 0,
    reward: 800,
    user: User.all.sample,
    category: 'Animal/Pet',
    address: 'Henrik Ibsensgate 2, Oslo'
  },
   {
    title: 'Red Jumper',
    description: "I left my jumper on the couch, next to the corner table at Kafferiet.",
    state: 0,
    reward: 50,
    user: User.all.sample,
    category: 'Clothes',
    address: 'Akersbakken 2, Oslo'
  },
   {
    title: 'Home-made bracelet',
    description: "Plastic beads in different colors and one with the letter 'P'.",
    state: 0,
    reward: 30,
    user: User.all.sample,
    category: 'Accessories',
    address: 'Stjerneblokkveien 5, 1083 Oslo'
  },
   {
    title: 'Water Bottle',
    description: "500 ml. It's black and made of stainless steel, and has a leak-proof seal.",
    state: 0,
    reward: 100,
    user: User.all.sample,
    category: 'Sports',
    address: 'Konowsgate 3, Oslo'
  },
   {
    title: 'Yucca plant',
    description: "A little plant in a brown ceramic pot. Left it on the parking lot.",
    state: 0,
    reward: 20,
    user: User.all.sample,
    category: 'Furnitures',
    address: 'Ensjøveien 21D, 0655 Oslo'
  },
   {
    title: 'Necklace',
    description: "Slim golden necklace with angel.",
    state: 0,
    reward: 150,
    user: User.all.sample,
    category: 'Accessories',
    address: 'Mortensrudveien 38, 1283 Oslo'
  },
   {
    title: 'Ruter pass',
    description: "My grandmother lost her ruter pass card on the Majorstua metro-station! Please help!",
    state: 0,
    reward: 300,
    user: User.all.sample,
    category: 'Credit Card',
    address: 'Valkyriegata 21, 0366 Oslo'
  },
   {
    title: 'Billabong Wallet',
    description: "Navy blue, contains a lot of coupon cards and a student-id",
    state: 0,
    reward: 100,
    user: User.all.sample,
    category: 'Wallet',
    address: 'Rubina Ranas gate 7, 0190 Oslo'
  },
   {
    title: 'Mountain-Fox Backpack',
    description: "It's an olive-green backpack. Has a few books in it and a lunch-box(throw out!)",
    state: 0,
    reward: 50,
    user: User.all.sample,
    category: 'Other',
    address: 'Christoffer Hellums vei 29, 0950 Oslo'
  },
   {
    title: 'Suitcase with combination lock',
    description: "Fortified secret agent suitcase with self-incinerating mechanism if picked. Contains top secret documents. Anonymous exchange.",
    state: 0,
    reward: 1000,
    user: User.all.sample,
    category: 'Transportation',
    address: 'Stortingsgata 12, 0161 Oslo'
  },
   {
    title: 'Smart Phone',
    description: "Chineese brand, has a mark of a fall on the top right corner.",
    state: 0,
    reward: 500,
    user: User.all.sample,
    category: 'Electronics',
    address: 'Øvre Slottsgate 16, 0157 Oslo'
  },
   {
    title: 'Shorts',
    description: "Forgot my cool surf-shorts at the Sauna House close to the Opera.",
    state: 0,
    reward: 50,
    user: User.all.sample,
    category: 'Sports',
    address: 'Kirsten Flagstads Plass 1, 0150 Oslo'
  },
]

Item.create!(items_attributes)



puts 'Finished!'
