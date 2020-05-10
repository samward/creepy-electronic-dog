Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :articles, only: [:index] do
    member do
      patch :like
    end
  end

  root to: "articles#index"
end
