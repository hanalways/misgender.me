Rails.application.routes.draw do
  resources :queries
  resources :ethnicities
  resources :genders

  root "static_pages#home"

  get "/misgender-me", to: "static_pages#new"
  get "/result", to: "static_pages#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
