require 'faker'

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Restaurant.destroy_all

categories = %w[chinese italian japanese french belgian]

5.times do
  restaurant = Restaurant.create!({
                                    name: Faker::Lorem.sentence,
                                    address: Faker::Address.full_address,
                                    phone_number: Faker::PhoneNumber.phone_number,
                                    category: categories[rand(0..(categories.length - 1))]
                                  })

  rand(1..5).times do
    @review = Review.create!({
                               rating: rand(0..5),
                               content: Faker::Lorem.sentence,
                               restaurant_id: restaurant.id
                             })
  end
end
