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
  
    def self.vegetarian
            
      .joins(:meals_ingredients)
          .joins(:ingredients)
          .where.not(name: ['chicken', 'beef', 'pork'])
    end

    def self.glutenfree
      where.not(name: [ "bread", "pasta", "ziti", 'farro'])
    end

end
