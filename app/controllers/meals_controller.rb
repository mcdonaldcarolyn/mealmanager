class MealsController < ApplicationController


  def index
    @meals = Meal.all
  end
  def new 
    @meal = Meal.new
  end

  def show 
    @meals = Meal.all
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


  
  
  def index
  end
private
  def meal_params 
    params.require(:meal).permit(:title, ingredients:[], ingredients_attributes: [:name])
  end
end
