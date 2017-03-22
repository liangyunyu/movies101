Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :movies do
    member do
      review :join
      review :quit
    end
    resources :reviews
  end

  namespace :account do
    resources :movies
    resources :reviews
  end
  root 'movies#index'
  #root 'welcome#index'
end
