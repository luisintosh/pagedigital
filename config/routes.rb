Rails.application.routes.draw do
  resources :pages, param: :slug do
    resource :page_profile, only: %i[edit update]
    resource :page_appearance, only: %i[edit update]
    resource :page_contact, only: %i[edit update]
    resource :page_integration, only: %i[edit update]
    resources :content_items do
      member do
        patch 'reorder-link'
      end
    end
  end

  get ':page_slug', to: 'public#page', as: :public_page
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'public#index'
end
