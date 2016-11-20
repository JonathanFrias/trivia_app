Rails.application.routes.draw do
  resources :trivia_questions
  resources :users, except: [:destroy]

  get "/sessions/new" => "user_sessions#new", as: :log_in_path
  post "/sessions" => "user_sessions#create"
  delete "/sessions" => "user_sessions#destroy", as: :log_out_path

  root 'trivia_questions#index'
end
