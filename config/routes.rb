Rails.application.routes.draw do

  root 'welcome#index'
  # root 'users#index'
  get 'users' => 'users#index'
  get 'users/new' => 'users#new', as: :new_user
  get 'users/:id' => 'users#show', as: :user
  post 'users' => 'users#create'
  get 'users/:id/edit' => 'users#edit', as: :edit_user
  patch 'users/:id' => 'users#update'
  delete 'users/:id' => 'users#destroy'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'bottles' => 'bottles#index'
  get 'bottles/new' => 'bottles#new', as: :new_bottle
  get 'bottles/:id' => 'bottles#show', as: :bottle
  post 'bottles' => 'bottles#create'
  get 'bottles/:id/edit' => 'bottles#edit', as: :edit_bottle
  patch 'bottles/:id' => 'bottles#update'
  delete 'bottles/:id' => 'bottles#destroy'




  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

end
