class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :category, index: true, foreign_key: true
      t.string :name
      t.text :description
      t.integer :price_cents, default: 0
      t.string :price_currency, default: 'USD'

      t.timestamps null: false
    end
  end
end
