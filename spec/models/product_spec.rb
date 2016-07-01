require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'associations' do
    it { is_expected.to have_many(:category_products) }
    it { is_expected.to have_many(:categories) }
  end
end
