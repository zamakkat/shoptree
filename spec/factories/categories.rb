FactoryGirl.define do
  factory :category do
    name { Faker::Commerce.department(2) }
  end
end
