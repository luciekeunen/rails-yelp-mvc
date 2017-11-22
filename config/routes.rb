Rails.application.routes.draw do

  resources :restaurants, only: [:index, :show, :new, :create] do
    # I kept the route for review#new just to please rake
    # but I don't need it as the review_form is in restaurant show view
    resources :reviews, only: [:create, :new]
  end

  root to: 'restaurants#index'
end
