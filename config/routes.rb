Rails.application.routes.draw do
  scope :admin do
    resources :pages, param: :slug, path: '/' do
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
  end

  get 'terms', to: 'public#terms', as: :public_terms
  get 'privacy', to: 'public#privacy', as: :public_privacy
  match ':page_slug', to: 'public#page', as: :public_page, via: %i[get post]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'public#index'
end
