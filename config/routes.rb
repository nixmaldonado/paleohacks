Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:index, :show]
  resources :topics

  resources :questions do
    member do
      put :upvote
      put :downvote
    end

    resources :answers do
      member do
        put :upvote
        put :downvote
      end
    end
  end

  root to: 'questions#index'
end
