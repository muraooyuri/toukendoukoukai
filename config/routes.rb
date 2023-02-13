Rails.application.routes.draw do
  
 
  resources :categories

  namespace :genres do
  get 'toukens/index'
  end
  
  get 'genres/index'
  get 'search' => 'searches#search'
  
  devise_for :users
  #get 'home/about'=>'homus#about', as: 'about'
  root to: 'homus#top'
  
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  resources :toukens, only: [:create, :new, :index, :show, :destroy, :edit, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :touken_comments, only: [:create, :destroy]
  end
  
  resources :genres, only: [:index, :new, :_sidebar] do
    resources :toukens, only: :index, module: :genres
  end  
  
  resources :users, only: [:create, :index, :show, :destroy, :edit] do
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
