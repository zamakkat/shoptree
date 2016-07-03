FactoryGirl.define do
  factory :product do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence(5) }
    price { Faker::Commerce.price }
  end
end
