Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :users, only: [:create] do 
      post '/follow/:id', to: 'relationships#create', as: 'users_follow'
      post '/unfollow/:id', to: 'relationships#destroy', as: 'users_unfollow'
      get '/followers', to: 'users#followers', as: 'users_followers'
    end
  end
end
