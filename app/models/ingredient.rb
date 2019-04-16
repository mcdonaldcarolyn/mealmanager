class Ingredient < ApplicationRecord
    has_many :meals_ingredients
    has_many :meals, through: :meals_ingredients
    validates :name,  presence: true, uniqueness: true
end
