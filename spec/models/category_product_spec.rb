require 'rails_helper'

RSpec.describe CategoryProduct, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:category).counter_cache(:products_count) }
    it { is_expected.to belong_to(:product) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:category) }
    it { is_expected.to validate_presence_of(:product) }
    it {
      create(:category_product, category: build(:category), product: build(:product))
      is_expected.to validate_uniqueness_of(:product_id).scoped_to(:category_id)
    }
  end
end
