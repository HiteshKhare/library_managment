Rails.application.routes.draw do
  resources :articles do
    resources :comments
  end
  root "articles#index"
  post '/articles/:id/follow', to: "articles#follow", as: "follow_user"
  post '/articles/:id/unfollow', to: "articles#unfollow", as: "unfollow_user"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
