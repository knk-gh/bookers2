Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  authenticated :user do
  	root :to => "users#show", :as => "user_authenticated_root"
  end
  root 'home#top'

  resources :books, only: [:new, :create, :index, :show, :destroy]



  get '/about' => 'home#about'
  get '/users/sign_in' => 'sessions#new'
  resources :users, only: [:show]
end
