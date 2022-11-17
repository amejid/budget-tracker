Rails.application.routes.draw do
  devise_for :users

  resources :categories, except: [:update, :edit, :destroy] do
    resources :expenses, only: [:new, :create]
  end

  root "home#index"
end
