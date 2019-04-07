Rails.application.routes.draw do
  resources :results, only: [:new, :create, :show]
  resources :queries, only: [:new, :create, :show]

  scope "/admin" do
    resources :queries, except: [:new, :create, :show]
    resources :ethnicities
    resources :genders
    resources :results, except: [:new, :create, :show]
  end

  root "static_pages#home"

  get "/misgender-me", to: "queries#new"
  post "/submit", to: "queries#create"
  get "/feedback", to: "results#new"
  post "/submit-feedback", to: "results#create"
  patch "/submit-feedback", to: "results#update"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
