Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  # resources :articles
  
  root 'welcome#index'

  resources :articles do
    resources :comments
    resources :photo
  end

  get '/show_user_posts' => 'articles#show_user_posts'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
