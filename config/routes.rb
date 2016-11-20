Rails.application.routes.draw do
  resources :users

  get "/sessions/new" => "user_sessions#new", as: :log_in_path
  post "/sessions" => "user_sessions#create"
  delete "/sessions" => "user_sessions#destroy", as: :log_out_path
end
