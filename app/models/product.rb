class Product < ActiveRecord::Base
    validates :title, :description, :image_url, presence: true
    validates :price, numericality: {greater_than_or_equal_to: 0.01}
    validates :title, uniqueness: true
    self.per_page = 7

    def self.latest
        Product.order(:updated_at).last
    end
end
