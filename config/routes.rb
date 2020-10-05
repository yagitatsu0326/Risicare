Rails.application.routes.draw do

  root "member/homes#top"
  #管理者サイト
  devise_for :admins
  namespace :admin do
  	resources :informations
  	resources :schedules
  	resources :members, only: [:index]
  	resources :questions, only: [:index]
  	resources :answers, only: [:new,:create,:show,:edit,:destroy,:update]
  end

  #会員用サイト
  devise_for :members
  namespace :member do
  	resources :posts
  	resources :notifications, only: [:index]
  	resources :members, only: [:index,:show,:edit,:update]
  	resources :inquiries, only: [:new,:index,:create,:show]
  end
  scope module: :member do
  	get "homes" => "homes#top"
  	resources :informations, only: [:index,:show]
  	resources :schedules, only: [:index,:show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
