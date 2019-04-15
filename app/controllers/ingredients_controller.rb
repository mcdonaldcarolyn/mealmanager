class IngredientsController < ApplicationController
  before_action :authenticate_user!
  def index 
    if params[:meal_id]
      @meal = Meal.find(params[:meal_id])
      @ingredients = @meal.ingredients
      @meals_ingredient = MealsIngredient.new
      render :show
    else
      @ingredients = Ingredient.all
    end
  end

  def show 
    @ingredient = Ingredient.find(params[:id])
    @meals_ingredients = MealsIngredient.all

    @units = [{ :name => "liters, oz, lbs, cups" }]
  end

  def new
    @ingredient = Ingredient.new
  end

  def create 
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to meal_ingredients_path
    else
      render :new
    end
  end

  def edit 
    @ingredient = Ingredient.find(params[:id])
    @ingredients = Ingredient.all
  end


  private 
  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
