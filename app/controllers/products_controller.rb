class ProductsController < ApplicationController
  def index
    @products = Product.all
    respond_to do |format|
      format.html do
        @root_categories = Category.roots
      end
      format.js { render status: :ok }
    end
  end
end
