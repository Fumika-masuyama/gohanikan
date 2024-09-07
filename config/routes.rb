Rails.application.routes.draw do
  devise_for :users

  # 'gourmets#index' をルートに設定
  root 'gourmets#index'

  resources :gourmets do
    collection do
      get 'search'
      get 'gourmets/new' => 'gourmets#new'
      post 'gourmets' => 'gourmets#create'
      get 'gourmets/:id' => 'gourmets#show', as: 'tweet'
      patch 'gourmets/:id' => 'gourmets#update'
      delete 'gourmets/:id' => 'gourmets#destroy' #ここに挿入！！！
      get 'gourmets/:id/edit' => 'gourmets#edit', as: 'edit_tweet'
    end
  end
end