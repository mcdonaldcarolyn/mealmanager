Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :meals do 
    resources :ingredients
  end
  resources :meals_ingredients
  resources :ingredients

  root to: "meals#index"
end
