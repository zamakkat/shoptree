class ProductsController < ApplicationController
  def index
    @root_categories = Category.roots
    @active_categories = Category.where(id: params[:category_ids])
    categories = @active_categories.collect(&:self_and_descendant_ids).flatten.uniq

    if categories.any?
      @products = Product.joins(:category_products)
                         .where('category_products.category_id' => categories)
                         .uniq
    else
      @products = Product.all.uniq
    end
    respond_to do |format|
      format.html
      format.js { render status: :ok }
    end
  end
end
