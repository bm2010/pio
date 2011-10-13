class Product < ActiveRecord::Base
  has_one :category
  has_one :group
  has_one :manufacturer
end
