class MealsIngredientsController < ApplicationController


  def create

    if meals_ingredient_params[:ingredient_id].length > 0
      meal_ingredient = MealsIngredients.params_check(meals_ingredient_params)
      redirect_to meal_ingredients_path(meal_ingredient.meal)
    else
      meal_ingredient = MealsIngredient.params_make(meals_ingredient_params)
      redirect_to meal_ingredients_path(meal_ingredient.meal)
    end
  end
  def index
  
  end

  def show 
     @meal = Meal.find_by(params[:meal_id])
     @meals_ingredient = MealsIngredient.find(params[:id])
  end

private 
def meals_ingredient_params
  params.require(:meals_ingredient).permit(:amount, :unit, :meal_id, :ingredient_id, ingredient:[:name])
end

end