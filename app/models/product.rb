class Product < ActiveRecord::Base
    extend FriendlyId
    friendly_id :title, use: [:slugged, :finders]

    has_many :line_items
    has_many :orders, through: :line_items

    before_destroy :ensure_not_referenced_by_any_line_items

    validates :title, :description, :image_url, presence: true
    validates :price, numericality: {greater_than_or_equal_to: 0.01}
    validates :title, uniqueness: true

    #pagination
    self.per_page = 9


    def self.latest
        Product.order(:updated_at).last
    end


    private

      def ensure_not_referenced_by_any_line_item
        if line_items.empty?
            return true
        else
            errors.add(:base, 'существуют товарные позиции')
            return false
        end
      end

end
