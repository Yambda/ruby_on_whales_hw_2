Rails.application.routes.draw do
  root "main#index"
  get 'cities/view', to: 'cities#view'
  get 'cities/new', to: 'cities#new'
  post 'cities/new', to: 'cities#create'
  post 'cities/create', to: 'cities#create'
  get 'cities/update', to: 'cities#updateget'
  post 'cities/update', to: 'cities#updatepost'
end
