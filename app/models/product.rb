class Product < ActiveRecord::Base
  has_many :category_products
  has_many :categories, through: :category_products

  monetize :price_cents

  validates_presence_of :name
end
