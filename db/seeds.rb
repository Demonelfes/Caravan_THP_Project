require "faker"

def generate_registration_plate
  letters = ('A'..'Z').to_a
  digits = ('0'..'9').to_a
  # Format AB-123-DE
  "#{letters.sample(2).join}-#{digits.sample(3).join}-#{letters.sample(2).join}"
end

Review.destroy_all
Order.destroy_all
Rental.destroy_all
JoinVanTag.destroy_all
Tag.destroy_all
Van.destroy_all
User.destroy_all

User.create!(
  email: "caravan@pro.fr",
  password: "password",
  is_admin: true
)

5.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: "123456")
end

10.times do
  v = Van.create!(
    title: Faker::Book.title.truncate(20),
    description: Faker::Lorem.paragraph(sentence_count: rand(1..5)),
    city: Faker::Address.city,
    is_van_pro: [true, false].sample,
    is_hidden: false,
    energy: Faker::Vehicle.fuel_type.truncate(20),
    # latitude:Faker::Address.latitude,
    # longitude:Faker::Address.longitude,
    brand: Faker::Vehicle.make,
    is_manual_transmission: [true, false].sample,
    registration: generate_registration_plate,
    year: rand(1940..Date.current.year),
    bed_number: rand(1..8),
    has_wc: [true, false].sample,
    has_fridge: [true, false].sample,
    has_shower: [true, false].sample,
    price_per_day: rand(100..1000),
    user_id: rand(User.first.id..User.last.id)
  )
  v.photo.attach(io: File.open(File.join(Rails.root, "app/assets/images/default_van.jpg")), filename: "Default")

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

5.times do |count| #à supprimer
  Rental.create!(
    start_date: Faker::Date.forward(days: 30),
    end_date: Faker::Date.between(from: '2023-12-31', to: '2025-12-31'),
    van_id: Van.find(count+Van.first.id).id,
    customer_id: rand(User.first.id..User.last.id),
    owner_id: rand(User.first.id..User.last.id),
    total_price: rand(500..5000),
  )
end

# 1.times do
#   Review.create!(
#     order_id:rand(Order.first.id..Order.last.id),
#     content: Faker::Quote.famous_last_words,
#     rating: rand(1..5)
#   )
# end
