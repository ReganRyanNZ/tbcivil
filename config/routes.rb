Rails.application.routes.draw do
  resources :projects
  resources :materials
  resources :machines
  devise_for :users
  root to: "entries#new"
  get 'pdf', to: "pages#pdf"
  resources :entries
end
