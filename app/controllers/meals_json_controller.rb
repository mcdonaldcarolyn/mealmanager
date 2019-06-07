class MealsJsonController < ApplicationController
    def show 
        @meal = Meal.find(params[:id])
        @ingredients = @meal.ingredients
        render json: @ingredients
    end

    def create
        
    
    end
end
