require "faker"

def generate_registration_plate
  letters = ('A'..'Z').to_a
  digits = ('0'..'9').to_a
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
  random_photo = ["default_van1.jpg", "default_van2.jpg", "default_van3.jpg", "default_van4.jpg", "default_van5.jpg"].sample
  v = Van.create!(
    title: Faker::FunnyName.name.truncate(20),
    description: Faker::Lorem.paragraph(sentence_count: rand(3..5)),
    city: Faker::Address.city,
    is_van_pro: [true, false].sample,
    is_hidden: false,
    energy: Faker::Vehicle.fuel_type.truncate(20),
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

  3.times do
    random_photo = ["default_van1.jpg", "default_van2.jpg", "default_van3.jpg", "default_van4.jpg", "default_van5.jpg"].sample
    v.photos.attach(io: File.open(File.join(Rails.root, "app/assets/images", random_photo)), filename: "Default")
  end

end

array_tags = ["vintage", "familial", "luxe", "camper", "confort", "tout-terrain"]
6.times do |index|
  Tag.create!(
    title: array_tags[index]
  )
end

6.times do
  JoinVanTag.create!(
    van_id:rand(Van.first.id..Van.last.id),
    tag_id:rand(Tag.first.id..Tag.last.id)
  )
end