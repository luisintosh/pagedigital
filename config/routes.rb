Rails.application.routes.draw do
  resources :pages do
    member do
      patch 'update-profile'
      patch 'update-appearance'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
