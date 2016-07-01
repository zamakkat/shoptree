FactoryGirl.define do
  factory :product do
    category nil
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence(5) }
    price_cents { Faker::Commerce.price * 100 }
    price_currency 'USD'
  end
end
