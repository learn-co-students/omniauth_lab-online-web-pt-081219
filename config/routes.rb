Rails.application.routes.draw do
  root :to => 'welcome#home'
  post 'logout', to: 'sessions#destroy'

  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
end
