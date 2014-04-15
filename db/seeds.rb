# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

Product.delete_all
20.times do
    Product.create!(
        title: "#{Faker::Lorem.sentence(2)}",
        description: "#{Faker::Lorem.paragraph(2)}",
        image_url: 'images/image_url',
        price: Faker::Number.number(4)
        )
end
puts 'GENERATED 20 PRODUCTS'
