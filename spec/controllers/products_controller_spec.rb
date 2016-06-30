require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe 'GET #index' do
    context 'html' do
      def do_request
        get :index
      end

      before { do_request }

      it { expect(assigns[:products]).to be_a(Array) }
      it { expect(response).to be_success }
    end

    context 'js' do
      def do_request
        xhr :get, :index
      end

      before { do_request }

      it { expect(assigns[:products]).to be_a(Array) }
      it { expect(response).to have_http_status(200) }
      it { expect(response).to render_template('products/index') }
    end
  end
end
