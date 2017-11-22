require 'faker'

["chinese", "italian", "japanese", "french", "belgian"]

10.times do
  Restaurant.create!(
    name: Faker::Dessert.variety,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: ["chinese", "italian", "japanese", "french", "belgian"].sample
  )
end
