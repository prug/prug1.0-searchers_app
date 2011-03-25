class Post < ActiveRecord::Base
  
  attr_accessible :body, :title, :category_id
  
  # =========
  # = assoc =
  # =========
  
  has_many :post_categories, :dependent => :destroy
  has_many :categories, :through => :post_categories
  
  # ===========
  # = sunspot =
  # ===========
  
  searchable do
    
    text :body
    text :title
    integer(:category_ids, :multiple => true, :references => Category)
    
  end
  
  
end
