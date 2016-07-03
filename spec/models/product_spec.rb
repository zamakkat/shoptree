require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'associations' do
    it { is_expected.to have_many(:category_products).dependent(:destroy) }
    it { is_expected.to have_many(:categories) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
