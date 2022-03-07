Rails.application.routes.draw do


  root to: 'articles#index'
  get 'mypage' => 'mypages#index'
  get 'articles' => 'articles#search'
  get '_mypage' => 'mypages#search'
  devise_for :users,
    controllers: {sessions: 'users/sessions'}
  resources :articles

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
