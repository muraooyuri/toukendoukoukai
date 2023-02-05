Rails.application.routes.draw do
  devise_for :users
  root to: 'homus#top'
  get 'touken/new'
  get 'touken/index'
  get 'touken/show'
  get 'touken/edit'
  #get 'lists/new'
  #get 'lists/index'
  #get 'lists/show'
  #get 'lists/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
