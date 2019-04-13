class MealsController < ApplicationController

  def new 
    @meal = Meal.new
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
end
