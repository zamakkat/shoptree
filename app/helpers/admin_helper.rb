module AdminHelper
  def category_hierarchy(category)
    ([category] + category.ancestors).reverse.collect(&:name).join(' > ')
  end
end
