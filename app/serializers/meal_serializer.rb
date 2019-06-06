class MealSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :meals_ingredients
end
