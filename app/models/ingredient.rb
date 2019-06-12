class Ingredient < ApplicationRecord
    has_many :meals_ingredients
    has_many :meals, through: :meals_ingredients
    validates :name,  presence: true, uniqueness: true

    def self.veggie
      where.not(name: ["chicken", "beef", "ground beef", "pork"])
    end

    def self.meat
      where(name: ["chicken", "beef", "ground beef", "pork"])
    end
  

    def self.gluten
      where(name: [ "bread", "pasta", "ziti", 'farro', "dough"])
    end

end
