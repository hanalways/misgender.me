Rails.application.routes.draw do
  resources :results, only: [:create, :show]
  resources :queries, only: [:new, :create] do
    resources :results, only: [:new]
  end

  scope "/admin" do
    resources :queries, except: [:new, :create]
    resources :ethnicities
    resources :genders
    resources :results, except: [:new, :create, :show]
  end

  root "static_pages#home"

  get "/misgender-me", to: "queries#new"
  get "/feedback", to: "results#new"
  post "/submit-feedback", to: "results#create"
  patch "/submit-feedback", to: "results#update"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
