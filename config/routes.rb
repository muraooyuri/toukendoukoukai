Rails.application.routes.draw do

  namespace :admin do
    #root to: 'homes#top'
    resources :toukens, only: [:index, :destroy]
    resources :touken_comments, only: [:index, :destroy]
  end

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

  resources :users, except: [:destroy] do
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
