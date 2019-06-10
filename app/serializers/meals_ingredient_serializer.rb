class MealsIngredientSerializer < ActiveModel::Serializer
  attributes :id, :amount, :unit
  belongs_to :meal, serializer: MealSerializer

end
