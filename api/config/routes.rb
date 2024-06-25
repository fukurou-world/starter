Rails.application.routes.draw do
  # ログイン機能のルーティング
  mount_devise_token_auth_for 'Dealer', at: 'auth', controllers: {
    registrations: 'auth/registrations'
  }
    # ログインユーザー取得のルーティング
    namespace :auth do
      resources :sessions, only: %i[index]
    end

  mount_devise_token_auth_for 'Client', at: 'auth'
  as :client do
    # Define routes for Client within this block.
  end
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post 'skills/register', to: 'skills#register'
      get 'skills/index', to: 'skills#index'
      post 'skills/search', to: 'skills#search'
      put 'skills/update/:id', to: 'skills#update'
      delete 'skills/delete/:id', to: 'skills#delete'
      resources :hello, only:[:index]
      post 'areas/register', to: 'areas#register'
      get 'areas/index', to: 'areas#index'
      put 'areas/update/:id', to: 'areas#update'
      delete 'areas/delete/:id', to: 'areas#delete'
    end
  end
end
