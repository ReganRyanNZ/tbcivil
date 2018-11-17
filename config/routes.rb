Rails.application.routes.draw do
  devise_for :users
  root to: "entries#new"
  get 'pdf', to: "pages#pdf"
  resources :entries
end
