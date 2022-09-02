Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  scope :panel do
    devise_for :users
    resources :pages, param: :id, path: '/' do
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
  get 'p/thank-you', to: 'public#thank_you'
  match ':page_slug', to: 'public#page', as: :public_page, via: %i[get post]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'public#index'
end
