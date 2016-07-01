class ProductsController < ApplicationController
  def index
    @category = Category.find_by(id: params[:category_id])
    if @category
      @products = Product.where(category_id: @category.self_and_descendant_ids)
    else
      @products = Product.all
    end
    respond_to do |format|
      format.html do
        @root_categories = Category.roots
      end
      format.js { render status: :ok }
    end
  end
end
