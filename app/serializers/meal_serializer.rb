class MealSerializer < ActiveModel::Serializer
  attributes :id, :title
  has many: meals_ingredients
end
