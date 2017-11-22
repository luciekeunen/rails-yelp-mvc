require 'faker'

10.times do
  restaurant = Restaurant.create!(
    name: Faker::Dessert.variety,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: ["chinese", "italian", "japanese", "french", "belgian"].sample
  )

  Review.create!(
    content: Faker::HowIMetYourMother.quote,
    rating: %w(0 1 2 3 4 5).sample,
    restaurant_id: restaurant.id
  )
end
