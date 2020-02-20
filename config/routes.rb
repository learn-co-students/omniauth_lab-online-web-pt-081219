Rails.application.routes.draw do
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  get '/auth/github/callback', to: 'sessions#create'
  
  root 'welcome#home'
end
