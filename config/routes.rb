Rails.application.routes.draw do

  resources :users do
    collection do
      get 'sign_up'
      get 'login'
      get 'address'
      get 'pay'
      get 'telephone'
      get 'logout'
      get 'identification'
      get 'mypage'
    end
  end

  root 'products#index'
  resources :login, only: [:index, :new, :create]
  resources :sign_up, only: [:index, :new]
  resources :mypages, only: [:index]
  resources :profile ,only: [:index]
  resources :logout ,only: [:index]
  resources :cards,only: [:index, :show, :create]
  resources :purchase_confirmation ,only: [:index]
  resources :products,only: [:index, :show, :new, :create] do
    collection do
      get 'get_category_children', defaults:{ format: 'json'}
      get 'get_category_grandchildren', defaults:{ format:'json'}
      get 'error'
    end
  end

end
