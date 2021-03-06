# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all
300.times do |n|
    Product.create!(
        title: "#{Faker::Commerce.product_name}#{n}",
        description: "#{Faker::Lorem.paragraph(2)}",
        image_url: 'images/image_url',
        price: Faker::Number.number(3).to_f + 1.0
        )
end
puts 'GENERATED 2000 PRODUCTS'
