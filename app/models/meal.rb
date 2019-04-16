class Meal < ApplicationRecord
  has_many :meals_ingredients
  has_many :ingredients, through:  :meals_ingredients
  accepts_nested_attributes_for :ingredients
  

  def self.vegetarian
    where("id not in (select meal_id from meals_ingredients mi inner join ingredients i on mi.ingredient_id = i.id where i.name in ('chicken', 'steak', 'beef', 'ground beef'))")
  end

  def self.glutenfree
    where("id not in (select meal_id from meals_ingredients mi inner join ingredients i on mi.ingredient_id = i.id where i.name in ('pasta', 'bread', 'ziti', 'flour', 'farro', 'dough'))")
  end
end
