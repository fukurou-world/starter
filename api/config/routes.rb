Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post 'clients/search', to: 'clients#search'
      get 'clients/:id', to: 'clients#detail'
      put 'clients/update', to: 'clients#update'
      delete 'clients/delete', to: 'clients#delete'
      post 'dealers/search', to: 'dealers#search'
      get 'dealers/:id', to: 'dealers#detail'
      put 'dealers/update', to: 'dealers#update'
      post 'dealers/delete', to: 'dealers#delete'
      post 'skills/create', to: 'skills#create'
      get 'skills/index', to: 'skills#index'
      post 'skills/search', to: 'skills#search'
      put 'skills/update', to: 'skills#update'
      delete 'skills/delete', to: 'skills#delete'
      resources :hello, only:[:index]
      post 'areas/create', to: 'areas#create'
      get 'areas/index', to: 'areas#index'
      put 'areas/update', to: 'areas#update'
      delete 'areas/delete', to: 'areas#delete'
      get "askings/:client_id", to: 'askings#index'
      post "askings/send_mail", to: 'askings#send_mail'
    end
  end
end
