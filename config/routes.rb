Rails.application.routes.draw do
 
  #get 'user/index'
  #get 'user/show'
  #get 'user/edit'
  devise_for :users
  #get 'home/about'=>'homus#about', as: 'about'
  root to: 'homus#top'
  
  resources :toukens, only: [:create, :new, :index, :show, :destroy, :edit] do
    resource :favorites, only: [:create, :destroy]
    resources :touken_comments, only: [:create, :destroy]
  end
  
  resources :users, only: [:create, :index, :show, :destroy, :edit] do
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  #get 'touken/new'
  #get 'touken/index'
  #get 'touken/show'
  #get 'touken/edit'
  #get 'lists/new'
  #get 'lists/index'
  #get 'lists/show'
  #get 'lists/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
