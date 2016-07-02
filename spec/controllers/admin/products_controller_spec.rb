require 'rails_helper'

RSpec.describe Admin::ProductsController, type: :controller do
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

    it { expect(assigns[:product]).to be_instance_of(Product) }
    it { expect(response).to be_success }
  end

  describe '#create' do
    def do_request
      post :create, product: params
    end

    context 'success' do
      let(:params) { attributes_for(:product) }

      subject { do_request }

      it 'creates a new product' do
        expect { do_request }.to change(Product, :count).by(1)
        expect(Product.last.name).to eq(params[:name])
        expect(Product.last.description).to eq(params[:description])
        expect(Product.last.price).to eq(Money.new(params[:price] * 100, 'SGD'))
      end

      it 'redirects' do
        do_request
        expect(response).to redirect_to admin_product_path(Product.last)
      end
    end
  end

  describe '#edit' do
    let(:product) { create(:product) }

    def do_request
      get :edit, id: product.id
    end

    before { do_request }

    it { expect(assigns(:product)).to eq product }
    it { expect(response).to be_success }
  end

  describe '#update' do
    let(:product) { create(:product) }

    def do_request
      patch :update, id: product.id, product: params
    end

    before { do_request }

    context 'success' do
      let(:params) { attributes_for(:product) }

      before { do_request }

      it { expect(assigns(:product)).to eq(product) }
      it { expect(response).to redirect_to admin_product_path(product) }
    end
  end

  describe '#destroy' do
    let!(:product) { create(:product) }

    def do_request
      delete :destroy, id: product.id
    end

    it 'deletes an product' do
      expect { do_request }.to change(Product, :count).by(-1)
    end

    it 'redirects' do
      do_request
      expect(response).to redirect_to admin_products_url
    end
  end
end
