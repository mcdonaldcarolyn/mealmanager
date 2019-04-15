class MealsIngredientsController < ApplicationController


  def create
    if meals_ingredient_params[:ingredient_id].length > 0
      MealsIngredients.params_check(meals_ingredient_params)
      redirect_to meal_ingredients_path(meal_ingredient.meal)
    else
      MealsIngredient.params_make(meals_ingredient_params)
      redirect_to meals_ingredients_path(meal_ingredient.meal)
    end
  end

private 
def meals_ingredient_params
  params.require(:meals_ingredient).permit(:amount, :unit, :meal_id, :ingredient_id, ingredient:[:name])
end

end