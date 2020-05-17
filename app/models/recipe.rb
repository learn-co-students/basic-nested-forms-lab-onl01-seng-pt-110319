class Recipe < ActiveRecord::Base
  has_many :ingredients 
  accepts_nested_attributes_for :ingredients

  def ingredient_attributes(name)
  end
end
