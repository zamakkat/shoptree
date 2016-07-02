module ProductsHelper
  # Category is active if it belongs to the filtering criteria
  def is_active?(category)
    @active_categories&.include?(category)
  end

  # Category is collapsed if any of it's children are active
  def is_collapsed?(category)
    @active_categories&.collect(&:ancestors).flatten.uniq&.include?(category)
  end

  def url_for_category_filter(id)
    if params[:category_ids]&.include?(id.to_s)
      params
    else
      params.merge('category_ids[]' => id)
    end
  end
end
