# typed: strict
Rails.application.routes.draw do
  root 'homepage#index'

  get 'homepage/index'
  resources :mtransactions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
