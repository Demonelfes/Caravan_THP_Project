# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"

# Historic.destroy_all
Review.destroy_all
Order.destroy_all
JoinVanTag.destroy_all
Tag.destroy_all
Van.destroy_all
User.destroy_all

User.create!(
  email: "chadmin@admin.fr",
  password: "password",
  is_admin: true
)

5.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: "123456")
end

10.times do
  Van.create!(
    title:Faker::Quote.unique.singular_siegler,
    description:Faker::Lorem.sentence,
    city:Faker::Address.city,
    # latitude:Faker::Address.latitude,
    # longitude:Faker::Address.longitude,
    brand:"Renault",
    is_manual_transmission: Faker::Boolean.boolean,
    year:"2020",
    bed_number: rand(1..8),
    has_wc: Faker::Boolean.boolean,
    has_fridge: Faker::Boolean.boolean,
    has_shower: Faker::Boolean.boolean,
    price_per_day: rand(100..1000),
    user_id:rand(User.first.id..User.last.id)
  )
end

5.times do
  Tag.create!(
    title: Faker::Verb.base
  )
end

2.times do
  JoinVanTag.create!(
    van_id:rand(Van.first.id..Van.last.id),
    tag_id:rand(Tag.first.id..Tag.last.id)
  )
end

4.times do
  Order.create!(
    start_date: Faker::Date.forward(days: 30),
    end_date: Faker::Date.between(from: '2023-12-31', to: '2025-12-31'),
    van_id: rand(Van.first.id..Van.last.id),
    # owner_id: rand(User.first.id..User.last.id),
    customer_id: rand(User.first.id..User.last.id)
  )
end

1.times do
  Review.create!(
    order_id:rand(Order.first.id..Order.last.id),
    content: Faker::Quote.famous_last_words,
    rating: rand(1..5)
  )
end
