Rails.application.routes.draw do

  root 'trivia_questions#index'

  resources :answers, except: [:new, :update, :destroy]
  get '/answer_for/:question_id' => 'answers#new', as: :new_answer_for

  resources :trivia_questions
  get "/trivia_questions/tag/:tag" => "trivia_questions#index", as: :trivia_tag

  resources :users, except: [:destroy]
  get "/users/new" => "users#new", as: :sign_up_path

  get "/sessions/new" => "user_sessions#new", as: :log_in_path
  post "/sessions" => "user_sessions#create"
  delete "/sessions" => "user_sessions#destroy", as: :log_out_path

end
