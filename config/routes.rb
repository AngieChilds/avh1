Rails.application.routes.draw do
  resources :comp_users
  get 'sessions/new'

  root   'static_pages#home'

  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users do
    member do

      patch 'mod'
      patch 'tr'
    end

  end
  resources :boards do
    resources :comments
  end
  resources :showblogs  do
    resources :showruns
  end
  resources :comps do
    resources :prizes, :rules, :jobs, :stories
      member do
        get 'pz'
      end
  end




end
