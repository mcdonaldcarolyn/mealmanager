Rails.application.routes.draw do
  devise_for :models
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :meals do 
  resources :ingredients
end
resources :meals_ingredients

root to: "meals#index"
end
