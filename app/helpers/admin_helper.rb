module AdminHelper
  def category_hierarchy(category)
    ([category] + category.ancestors).reverse
      .collect { |c| link_to(c.name, admin_category_path(c)) }
      .join(' > ')
      .html_safe
  end
end
