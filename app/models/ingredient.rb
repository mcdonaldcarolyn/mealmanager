class Ingredient < ApplicationRecord
    has_many :meals_ingredients
    has_many :meals, through: :meals_ingredients
    validates :name,  presence: true, uniqueness: true

    def ingredients=(ingredient_attribute)
      ingredient = Ingredient.find_or_create_by(ingredient_attribute)
      if ingredient.id 
        self.ingredient = ingredient
      end
    end

end
