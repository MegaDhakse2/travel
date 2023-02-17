Rails.application.routes.draw do
  root 'travel#index'
  get "/search", to: "travel#search"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
