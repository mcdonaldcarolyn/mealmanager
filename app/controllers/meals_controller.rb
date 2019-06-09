class MealsController < ApplicationController
  before_action :authenticate_user!

  def index
    @meals = Meal.all
    @glutenfree = MealsIngredient.find_glutenfree_meals
    @vegetarian = MealsIngredient.find_veg_meals
    @meals_ingredient = MealsIngredient.new
    #render json: @meals
  end
  def show 
    @meals = Meal.all
    @meal = Meal.find(params[:id])
    @ingredients = Ingredient.all
    @meals_ingredient = MealsIngredient.new
   #render json: @meals
  end
  
  def new 
    @meal = Meal.new
  end

  

  def create
    @meal = Meal.new(meal_params)
    if @meal.save
      redirect_to meal_ingredients_path(@meal)
      #redirect_to new_meal_path(@meal)
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
    respond_to 
  else 
    redirect_to meals_path
  end
end

def destroy
  @meal = Meal.find(params[:id])
  @meal.destroy
  redirect_to meals_path
end


  
  
  
private
  def meal_params 
    params.require(:meal).permit(:title, :notes, ingredients:[], ingredients_attributes: [:name])
  end
end
