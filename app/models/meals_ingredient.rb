class MealsIngredient < ApplicationRecord
  belongs_to :meal
  belongs_to :ingredient
  accepts_nested_attributes_for :ingredient
  validates :amount,  presence: true

  
  def self.find_veg_meals
    # ingred_ids = Ingredient.veggie.ids 
    meat_ids = Ingredient.meat.ids
    meat_meal_ids = where(ingredient_id: meat_ids).pluck(:meal_id)
    where.not(meal_id: meat_meal_ids).collect(&:meal).uniq
    # where(ingredient_id: ingred_ids)
  
    # MealsIngredient.where.(ingredient_id: ingred_ids).collect(&:meal).uniq
    # MealsIngredient.where(ingredient_id: ingred_ids).pluck(:meal_id).uniq
  end  

  def self.find_glutenfree_meals
    gluten_ids = Ingredient.gluten.ids
    gluten_meal_ids = where(ingredient_id: gluten_ids).pluck(:meal_id)
    where.not(meal_id: gluten_meal_ids).collect(&:meal).uniq
  end

  def self.params_make (meals_ingredient_params)
      meal_ingredient = MealsIngredient.create({
        :meal_id => meals_ingredient_params[:meal_id],
        :ingredient_id => meals_ingredient_params[:ingredient_id],
        :amount => meals_ingredient_params[:amount],
        :unit => meals_ingredient_params[:unit]
      })

      meal_ingredient
  end

  def self.params_check(meals_ingredient_params, ingred)
    if (ingred)
      ingredient = Ingredient.find_or_create_by({
        :name => ingred[:name]
      })
      meal_ingredient = MealsIngredient.create({
        :meal_id => meals_ingredient_params[:meal_id],
        :ingredient_id => ingredient.id,
        :amount => 1,
        :unit => ''
      })
    else
      ingredient = Ingredient.find_or_create_by({
        :name => meals_ingredient_params[:ingredient][:name]
      })
      meal_ingredient = MealsIngredient.create({
        :meal_id => meals_ingredient_params[:meal_id],
        :ingredient_id => ingredient.id,
        :amount => meals_ingredient_params[:amount],
        :unit => meals_ingredient_params[:unit]
      })
    end

    puts 'here is '
    puts meal_ingredient

    meal_ingredient
  end

end
