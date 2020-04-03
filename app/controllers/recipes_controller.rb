class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.create(recipe_params)
    ingredient0 = Ingredient.create(ingredient_params(0))
    ingredient0.recipe_id=recipe.id
    ingredient0.save
    ingredient1 = Ingredient.create(ingredient_params(1))
    ingredient1.recipe_id=recipe.id
    ingredient1.save
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :title,
      ingredient_attributes: [
        :name,
        :quantity
      ]
    )
  end

  def ingredient_params(i)
    params[:recipe][:ingredients_attributes]["#{i}"].permit(
      :name,
      :quantity
    )
  end
end
