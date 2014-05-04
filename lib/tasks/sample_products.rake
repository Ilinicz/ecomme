namespace :db do 
    desc "Fill Db with sample products"
    task populate: :environment do
        make_products
    end
end

def make_products
  Product.delete_all
  puts "DB CLEANED"
  20.times do |n|
    Product.create!(
        title: "#{Faker::Commerce.product_name}#{n}",
        description: "#{Faker::Lorem.paragraph(4)}",
        image_url: 'images/image_url',
        price: Faker::Number.number(3)+1
        )
  end
  puts "SAMPLE PRODUCTS GENERATED"
end