Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :meals ,except: :show do 
    resources :ingredients, only: [:index, :destroy]
  end
  resources :meals_ingredients
  resources :ingredients
  resources :meals_json
  root to: "meals#index"
end
