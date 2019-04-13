class IngredientsController < ApplicationController

  def index 
    if params[:meal_id]
      @meal = Meal.find(params[:meal_id])
      @ingredients = @meal.ingredients
      @meals_ingredient = MealIngredient.new
      render :show
    else
      @ingredients = Ingredient.all
    end
  end

  def show 
    @ingredient = Ingredient.find(params[:id])
    @meals_ingredients = MealsIngredient.all
  end


end
