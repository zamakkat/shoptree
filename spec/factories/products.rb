FactoryGirl.define do
  factory :product do
    category nil
    name "MyString"
    description "MyText"
    price_cents 1
    price_currency "MyString"
  end
end
