module AdminHelper
  def category_hierarchy(category)
    (category.ancestors + [category]).collect(&:name).join(' > ')
  end
end
