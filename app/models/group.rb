class Group < ActiveRecord::Base
  belongs_to :manufacturer
  has_many :products
end
