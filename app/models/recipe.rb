class Recipe < ActiveRecord::Base
  has_many :ingredients 

  accepts_nested_attributes_for :ingredients

  def ingredient_attributes=(ingredients)
    self.ingredient = Ingredient.find_or_create_by(name: ingredients[:name], quantity: ingredients[:quantity])
    self.ingredient.update(ingredients)
  end
end
