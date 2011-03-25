class Category < ActiveRecord::Base
  
  attr_accessible :name
  
  has_many :post_categories, :dependent => :destroy
  
end
