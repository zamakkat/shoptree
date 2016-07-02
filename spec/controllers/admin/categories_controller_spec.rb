require 'rails_helper'

RSpec.describe Admin::CategoriesController, type: :controller do
  describe 'GET #index' do
    def do_request
      get :index
    end

    before { do_request }

    it { expect(response).to be_success }
  end

  describe 'GET #new' do
    def do_request
      get :new
    end

    before { do_request }

    it { expect(assigns[:category]).to be_instance_of(Category) }
    it { expect(response).to be_success }
  end

  describe '#create' do
    def do_request
      post :create, category: params
    end

    context 'success' do
      let(:params) { attributes_for(:category) }

      subject { do_request }

      it 'creates a new category' do
        expect { do_request }.to change(Category, :count).by(1)
        expect(Category.last.name).to eq(params[:name])
      end

      it 'redirects' do
        do_request
        expect(response).to redirect_to admin_category_path(Category.last)
      end
    end
  end

  describe '#edit' do
    let(:category) { create(:category) }

    def do_request
      get :edit, id: category.id
    end

    before { do_request }

    it { expect(assigns(:category)).to eq category }
    it { expect(response).to be_success }
  end

  describe '#update' do
    let(:category) { create(:category) }

    def do_request
      patch :update, id: category.id, category: params
    end

    before { do_request }

    context 'success' do
      let(:params) { attributes_for(:category) }

      before { do_request }

      it { expect(assigns(:category)).to eq(category) }
      it { expect(response).to redirect_to admin_category_path(category) }
    end
  end

  describe '#destroy' do
    let!(:category) { create(:category) }

    def do_request
      delete :destroy, id: category.id
    end

    it 'deletes an category' do
      expect { do_request }.to change(Category, :count).by(-1)
    end

    it 'redirects' do
      do_request
      expect(response).to redirect_to admin_categories_path
    end
  end
end
