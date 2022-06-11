Rails.application.routes.draw do
  resources :pages do
    resource :page_profile, only: %i[edit update]
    resource :page_appearance, only: %i[edit update]
    resource :page_contact, only: %i[edit update]
    member do
      patch 'update-integration'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
