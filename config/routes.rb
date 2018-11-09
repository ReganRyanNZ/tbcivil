Rails.application.routes.draw do
  root to: "entries#new"
  resources :entries
end
