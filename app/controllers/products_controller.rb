class ProductsController < ApplicationController
  def index
    @category = Category.find_by(id: params[:category_id])
    if @category
      @products = Product.joins(:category_products).where('category_products.category_id' => @category.self_and_descendant_ids).uniq
    else
      @products = Product.all.uniq
    end
    respond_to do |format|
      format.html do
        @root_categories = Category.roots
      end
      format.js { render status: :ok }
    end
  end
end
