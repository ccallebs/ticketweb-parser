Todo::Application.routes.draw do
  get "venues/show"

  match '/venues' => 'pages#venues'
  match '/events' => 'pages#events'

  resources :events, :only => [:show]
  resources :venues, :only => [:show]

  root :to => 'pages#index'
end
