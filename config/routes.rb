Superblog::Application.routes.draw do
  
  root :to => 'posts#index'
  
  resources :post_categories

  resources :categories

  resources :users

  resources :posts

end
