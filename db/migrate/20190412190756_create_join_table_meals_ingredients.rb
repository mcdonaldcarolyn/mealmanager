class CreateJoinTableMealsIngredients < ActiveRecord::Migration[5.2]
  def change 
    create_table :meals_ingredients do |t|
      t.integer :amount
      t.integer :meal_id
      t.integer :ingredient_id
      t.timestamps
    end
  end
end
