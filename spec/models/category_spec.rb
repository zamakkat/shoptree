require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'associations' do
    it { is_expected.to have_many(:category_products) }
    it { is_expected.to have_many(:products) }
  end
end
