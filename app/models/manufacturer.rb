class Manufacturer < ActiveRecord::Base
  has_many :categories
  has_many :groups
  has_many :producs
end
