namespace :db do 
    desc "Fill Db with sample products"
    task populate: :environment do
        make_products
    end
end

def make_products
  Product.delete_all
  puts "DB CLEANED"
  20.times do
    Product.create!(
        title: "#{Faker::Lorem.words(2).join(' ').capitalize!}",
        description: "#{Faker::Lorem.paragraph(4)}",
        image_url: 'images/image_url',
        price: Faker::Number.number(3)
        )
  end
  puts "SAMPLE PRODUCTS GENERATED"
end