Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :articles do
        get '/page/:page', action: :index, on: :collection
        get 'search/:query', to: 'articles#search', on: :collection
      end
      resources :comments do
        get '/page/:page', action: :index, on: :collection
        get ':article_id/search', to: 'comments#search', on: :collection
      end
    end
  end
end
