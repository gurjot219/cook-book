class RecipesController < ApplicationController
  # TODO: Implement

  def index
    if params["cuisine"].present?
      @recipies = Recipe.where("lower(cuisine) LIKE ?", "%#{params['cuisine']}%")
    elsif params["ingredient"].present?
      @recipies = Recipe.joins(:ingredients).where("lower(ingredients.name) LIKE ?", "%#{params['ingredient']}%")
    else
      @recipies = Recipe.includes(:ingredients)
    end
    @recipies
  end

  def new
    @recipe = Recipe.new
    3.times do
      @recipe.ingredients.build
    end
  end

  def create
    new_recipe = Recipe.create(recipe_params)
    redirect_to recipes_path
  end


  def recipe_params
    params.require(:recipe).permit(
			:cuisine,
      :name,
			:instructions,
			:cooking_time,
      ingredients_attributes: [ :name ]
    )
    end
end
