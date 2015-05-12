Rails.application.routes.draw do
  devise_for :users

  resources :topics

  resources :questions do
    resources :answers
    member do
      put :upvote_question
      put :downvote_question
    end
  end

  root to: 'questions#index'
end
