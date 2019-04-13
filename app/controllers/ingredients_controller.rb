class IngredientsController < ApplicationController

  def index 
    if params[:meals_id]
      @meal = Meal.find(params[:meal_id])
      @ingredients = @meal.ingredients
      @meal_ingredient = MealIngredient.new
      render :show
    else
      @ingredients = Ingredient.all
    end
  end

  
end
