Rails.application.routes.draw do
  # Add your routes here
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  get '/auth/github/callback', to: 'sessions#create'


  root 'welcome#home'
  get '/logout', to: 'sessions#destroy'
end
