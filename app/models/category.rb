class Category < ActiveRecord::Base
  has_closure_tree order: 'name'
end
