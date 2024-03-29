Rails.application.routes.draw do

  # 管理者側で不適切な投稿内容や投稿に関するコメントを削除する為の記述
  namespace :admin do
    #root to: 'homes#top'
    resources :toukens, only: [:index, :destroy]
    resources :touken_comments, only: [:index, :destroy]
  end
  # 管理者側は新規登録とログインする為のパスワードが必要のないので省く記述
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # 各ジャンルの一覧(index)ページに飛ぶ為の記述
  namespace :genres do
    get 'toukens/index'
  end

    get 'genres/index'
    get 'search' => 'searches#search'

  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    get '/users', to: 'devise/registrations#new'
  end
  #get 'home/about'=>'homus#about', as: 'about'
  root to: 'homus#top'

  # devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  #   sessions: "admin/sessions"
  # }

  resources :toukens, only: [:create, :new, :index, :show, :destroy, :edit, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :touken_comments, only: [:create, :destroy]
  end

  resources :genres, only: [:index, :new, :_sidebar] do
    resources :toukens, only: :index, module: :genres
  end
  
    #実際に表示される #コントローラ名#アクション名  #パスを記述する
    get 'users/toukens' => 'users#index', as: 'users_toukens'
    
  resources :users, except: [:index, :destroy] do
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
