class MealsIngredientsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_cors_headers

  def set_cors_headers
    response.set_header "Access-Control-Allow-Origin", origin
  end

  def origin
    request.headers["Origin"] || "*"
  end

  def create
    if meals_ingredient_params[:ingredient_id] && meals_ingredient_params[:ingredient_id].length > 0
      meal_ingredient = MealsIngredient.params_make(meals_ingredient_params)
    else
      meal_ingredient = MealsIngredient.params_check(meals_ingredient_params, params[:ingredient])
    end

    puts 'meal ingredient is '
    puts meal_ingredient.inspect

    respond_to do |format|    
      format.html {redirect_to meal_ingredients_path(meal_ingredient.meal)}    
      format.json {render json: meal_ingredient.ingredient}
    end
  end
  
  def show 
     @meal = Meal.find_by(params[:meal_id])
     @meals_ingredient = MealsIngredient.find(params[:id])
  end

  def edit 
    @meal_ingredient = MealsIngredient.find(params[:id])
    # render "meals_ingredient/edit"
  end

  def update
    @meal_ingredient = MealsIngredient.find(params[:id])
   if  @meal_ingredient.update(meals_ingredient_params)
    redirect_to meal_ingredients_path(@meal_ingredient.meal)
   else 
    render :edit
   end
  end

private 
def meals_ingredient_params
  params.require(:meals_ingredient).permit(:amount, :unit, :meal_id, :ingredient_id, ingredient:[:name])
end

end