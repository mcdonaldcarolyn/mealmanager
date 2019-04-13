class Meal < ApplicationRecord
  has_many :meals_ingredients
  has_many :ingredients, through:  :meals_ingredients
  accepts_nested_attributes_for :ingredients
end
