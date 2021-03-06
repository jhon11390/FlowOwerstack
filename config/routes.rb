Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'questions#index'
  resources :questions, except: [:edit, :update, :destroy] do
    resources :answers, only: [:create]
    resources :comments, only: [:create]
    resource :vote_question, only: [:create, :destroy]
    
  end

  resources :answers, only: [:create] do
    post '/commentanswer', to: 'comments#create_answer'
    resource :vote_answer, only: [:create, :destroy]
  end
end
