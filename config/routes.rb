Rails.application.routes.draw do
  resources :questions do
    resources :answers do
      patch 'accept', on: :member
    end
  end
  resources :comments
  devise_for :users, controllers: {
               sessions: 'users/sessions',
               passwords: 'users/passwords',
               registrations: 'users/registrations'
             }
  root 'questions#index'
end
