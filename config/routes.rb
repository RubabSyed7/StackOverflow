Rails.application.routes.draw do
  resources :questions do
    resources :answers do
      get 'accept', on: :member
    end
  end
  resources :comments
  
  devise_for :users, controllers: {
               registrations: 'users/registrations',
               sessions: 'users/sessions',
               passwords: 'users/passwords'
             }
  root 'questions#index'
end
