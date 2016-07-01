class Product < ActiveRecord::Base
  belongs_to :category, counter_cache: true

  monetize :price_cents
end
