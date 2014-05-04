ActiveAdmin.register Product do

  permit_params :title, :description, :image_url, :price, :slug

  index do
    column :title
    column :description
    column  "Release date", :created_at
    column :price, sortable: :price do |product|
      number_to_currency product.price
    end
    default_actions
  end
 
  
end
