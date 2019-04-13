class MealsIngredient < ApplicationRecord
  belongs_to :Meals
  belongs_to :ingredient
  accepts_nested_attributes_for :ingredient
end
