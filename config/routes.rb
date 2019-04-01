Rails.application.routes.draw do
  resources :results

  resources :queries
  resources :ethnicities
  resources :genders

  root "static_pages#home"

  get "/misgender-me", to: "queries#new"
  post "/submit", to: "queries#create"
  get "/feedback", to: "results#new"
  post "/submit-feedback", to: "results#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
