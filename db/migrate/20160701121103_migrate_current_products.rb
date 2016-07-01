class MigrateCurrentProducts < ActiveRecord::Migration
  def up
    Category.find_each { |category| Category.reset_counters(category.id, :products) }
    Product.find_each do |product|
      product.categories << Category.find(product.category_id)
    end
  end

  def down
    CategoryProduct.destroy_all
  end
end
