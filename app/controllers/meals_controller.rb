class MealsController < ApplicationController
  before_action :authenticate_user!

  def index
    @meals = []
  end
  
  def show 
    @meals = Meal.all
    @meal = Meal.find(params[:id])
    @ingredients = Ingredient.all
    @meals_ingredient = MealsIngredient.new
  end
  
  def new 
    @meal = Meal.new
  end

  def show 
    @meals = Meal.all
    @meal = Meal.find(params[:id])
    @ingredients = Ingredient.all
  end

  def create
    @meal = Meal.new(meal_params)
    if @meal.save
      redirect_to meal_ingredients_path(@meal)
    else
      render :new
    end
  end

  def edit 
    @meal = Meal.find(params[:id])
  end

  def update 
    @meal = Meal.find(params[:id])
    @meal.update(meal_params)
  if @meal.save
    redirect_to meals_path
  else 
    redirect_to meals_path
  end
end


  
  
  
private
  def meal_params 
    params.require(:meal).permit(:title, ingredients:[], ingredients_attributes: [:name])
  end
end
