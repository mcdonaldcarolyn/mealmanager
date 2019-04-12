class CreateMealsIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :meals_ingredients do |t|

      t.timestamps
    end
  end
end
