module AdminHelper
  def category_hierarchy(category)
    ([category] + category.ancestors).reverse
      .collect { |c| link_to(c.name, admin_category_path(c)) }
      .join(' > ')
      .html_safe
  end

  def nested_categories_collection
    category_options(Category.roots) { |c| "#{'-' * c.depth} #{c.name}" }
  end

  def category_options(categories)
    options = []
    categories.each do |category|
      puts category
      options << [yield(category), category.id]
      if category.children.any?
        options += category_options(category.children) { |c| "#{'-' * c.depth} #{c.name}" }
      end
    end
    options
  end
end
