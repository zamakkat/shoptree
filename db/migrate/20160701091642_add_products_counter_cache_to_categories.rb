class AddProductsCounterCacheToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :products_count, :integer, default: 0
  end
end
