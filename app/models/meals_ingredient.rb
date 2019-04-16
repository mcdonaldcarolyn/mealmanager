class MealsIngredient < ApplicationRecord
  belongs_to :meal
  belongs_to :ingredient
  accepts_nested_attributes_for :ingredient
  validates :amount,  presence: true

  

  def self.params_make (meals_ingredient_params)
      meal_ingredient = MealsIngredient.create({
        :meal_id => meals_ingredient_params[:meal_id],
        :ingredient_id => meals_ingredient_params[:ingredient_id],
        :amount => meals_ingredient_params[:amount],
        :unit => meals_ingredient_params[:unit]
      })

      meal_ingredient
  end

  def self.params_check(meals_ingredient_params)
    ingredient = Ingredient.find_or_create_by({
      :name => meals_ingredient_params[:ingredient][:name]
    })
    meal_ingredient = MealsIngredient.create({
      :meal_id => meals_ingredient_params[:meal_id],
      :ingredient_id => ingredient.id,
      :amount => meals_ingredient_params[:amount],
      :unit => meals_ingredient_params[:unit]
    })

    meal_ingredient
  end

end
