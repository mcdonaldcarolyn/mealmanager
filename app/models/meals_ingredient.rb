class MealsIngredient < ApplicationRecord
  belongs_to :meals
  belongs_to :ingredient
  accepts_nested_attributes_for :ingredient

  def self.params_check 
  
     meals_ingredient_params[:ingredient_id].length > 0
      meal_ingredient = MealsIngredient.create({
        :meal_id => meals_ingredient_params[:meal_id],
        :ingredient_id => meals_ingredient_params[:ingredient_id],
        :amount => meals_ingredient_params[:amount]
        :unit => meals_ingredients_params[:unit]
      })
  end

  def self.params_make
    ingredient = Ingredient.find_or_create_by({
      :name => meals_ingredient_params[:ingredient][:name]
    })
    meal_ingredient = MealsIngredient.create({
      :meal_id => meals_ingredient_params[:meal_id],
      :ingredient_id => ingredient.id,
      :amount => meals_ingredient_params[:amount]
      :unit => meals_ingredients_params[:unit]
  end
end
