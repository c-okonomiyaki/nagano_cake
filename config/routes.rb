Rails.application.routes.draw do

  #devise_for :admins
  #devise_for :customers

  devise_for:customers,skip:[:passwords],controllers:{
    registrations:"customers/registrations",
    sessions:"customers/sessions"
  }

  devise_for :admins,skip:[:registrations,:passwords],controllers:{
    sessions:"admins/sessions"
  }

  namespace :admins do
    resources :orders,only:[:index,:show,:update]
    resources :genres,only:[:index,:create,:edit,:update]
    get 'admins' => 'admins#homes'
    resources :items,only:[:index,:new,:create,:show,:edit,:update]
    resources :order_details,only:[:update]
    resources :customers,only:[:index,:show,:edit,:update]
  end

  scope module: :customers do
    resource :customers,only:[:show]
    get 'customers/customers/edit' => 'customers#edit'
    patch 'customers/customers/:id' => 'customers#update',as: :mypage
    get 'customers/withdrawal' => 'customers#withdrawal'
    patch 'customers/out/:id' => 'customers#out',as: :out

    root :to => "homes#top"
    get "about"=>"homes#about"
    delete 'carts/all_destory' => 'carts#all_destory',as: :all_destory
    post 'carts/all_destory' => 'carts#all_destory'
    resources :items,only:[:index,:show]
    resources :carts,only:[:index,:update,:create,:destroy]



    get 'orders/confirm' => 'orders#confirm'
    get 'orders/thanx' => 'orders#thanx'
    resources :orders,only:[:new,:create,:index,:show]

    resources :deliveries,only:[:index,:create,:destroy,:edit,:update]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
