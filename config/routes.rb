Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  # resources :articles
  
  root 'welcome#index'
  # root 'welcome#title'

  resources :articles do
    resources :comments
    resources :photo
  end
  
  get '/articles_grid' => 'articles#articles_grid'
  get 'articles_list' => 'articles#articles_list'
  get '/show_user_posts' => 'articles#show_user_posts'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
