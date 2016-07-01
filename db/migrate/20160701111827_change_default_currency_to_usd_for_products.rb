class ChangeDefaultCurrencyToUsdForProducts < ActiveRecord::Migration
  def up
    change_column_default :products, :price_currency, 'SGD'
    Product.find_each do |product|
      product.update_column(:price_currency, 'SGD')
    end
  end

  def down
    change_column_default :products, :price_currency, 'USD'
    Product.find_each do |product|
      product.update_column(:price_currency, 'USD')
    end
  end
end
