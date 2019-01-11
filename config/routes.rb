Rails.application.routes.draw do
  resources :materials
  devise_for :users
  root to: "entries#new"
  get 'pdf', to: "pages#pdf"
  resources :entries
end
