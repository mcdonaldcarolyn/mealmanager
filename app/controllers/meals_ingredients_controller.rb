class MealsIngredientsController < ApplicationController


  def create
    if meals_ingredient_params[:ingredient_id].length > 0
      MealsIngredients.params_check
      redirect_to meal_ingredients_path(meal_ingredient.meal)
    else
      Meals.Ingredient.params_make
      redirect_to meal_ingredients_path(meal_ingredient.meal)

  end
end