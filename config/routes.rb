Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :projects do
    resources :user_stories
  end

  authenticated :user do
    root 'projects#index', as: 'authenticated_user'
  end

  root 'welcome#index'
end
