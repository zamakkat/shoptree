require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe 'GET #index' do
    context 'html' do
      def do_request
        get :index
      end

      before do
        create_list(:product, 3)
        do_request
      end

      it { expect(assigns[:products].first).to be_a(Product) }
      it { expect(response).to be_success }
    end

    context 'js' do
      def do_request
        xhr :get, :index
      end

      before do
        create_list(:product, 3)
        do_request
      end

      it { expect(assigns[:products].first).to be_a(Product) }
      it { expect(response).to have_http_status(200) }
      it { expect(response).to render_template('products/index') }
    end
  end
end
