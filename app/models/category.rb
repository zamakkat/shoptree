class Category < ActiveRecord::Base
  has_many :category_products
  has_many :products, through: :category_products

  has_closure_tree

  def total_products_count
    self_and_descendants.collect(&:products_count).sum
  end
end
