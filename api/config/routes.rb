Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post 'skills/register', to: 'skills#register'
      get 'skills/index', to: 'skills#index'
      put 'skills/update/:id', to: 'skills#update'
      delete 'skills/delete/:id', to: 'skills#delete'
      resources :hello, only:[:index]
    end
  end
end
