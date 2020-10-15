Rails.application.routes.draw do

  root 'member/homes#top'
  #管理者サイト
  devise_for :admins
  namespace :admin do
  	resources :informations
  	resources :schedules
  	resources :members, only: [:index]
  	resources :answers
  end

  #会員用サイト
  devise_for :members
  namespace :member do
  	resources :posts do
      resources :comments, only: [:create, :destroy]
      resource :likes, only: [:create, :destroy]
    end
  	resources :notifications, only: [:index]
  	resources :members
    resources :questions, only: [:new, :create, :index, :show]
  end
  scope module: :member do
  	get 'homes', to: 'homes#top'
  	resources :informations, only: [:index,:show]
  	resources :schedules, only: [:index,:show]
    resources :inquiries, only: [:new,:create]
    post 'inquiries/confilm', to: 'inquiries#confilm', as: 'confilm'
    post 'inquiries/back', to: 'inquiries#back', as: 'back'
    get 'inquiries/done', to: 'inquiries#done', as: 'done'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
