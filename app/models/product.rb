class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :group
  belongs_to :manufacturer
end
