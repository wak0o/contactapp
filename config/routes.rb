Rails.application.routes.draw do
  root to: 'pages#home'

  resources :contacts do
    resources :tags
  end
end
