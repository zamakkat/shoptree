class CategoryProduct < ActiveRecord::Base
  belongs_to :category, required: true, counter_cache: 'products_count'
  belongs_to :product, required: true

  validates_uniqueness_of :product_id, scope: :category_id
end
