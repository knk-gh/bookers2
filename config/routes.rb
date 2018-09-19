Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#top'

  resources :books, only: [:edit, :create, :index, :show, :destroy, :update]
  resources :users, only: [:index, :show, :edit, :update]



  get '/about' => 'home#about'

end
