# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Restaurant.destroy_all
p 'wiping database'
10.times do
  category = ['chinese', 'italian', 'japanese', 'french', 'belgian'].sample
  name = Faker::Hipster.words(2).map! { |word| word.capitalize }.join(' ')
  r = Restaurant.create(name: name, category: category,
                        address: Faker::Address.full_address,
                        phone_number: Faker::PhoneNumber.cell_phone)
  puts "creating #{r.name}!"
  5.times do
    rating = [1, 2, 3, 4, 5].sample
    Review.create(content: Faker::Hipster.paragraph, rating: rating,
                  restaurant: r)
  end
end
