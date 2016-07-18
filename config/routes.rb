Rails.application.routes.draw do
  # You can have the root of your site routed with "root"
  root 'static_pages#index'

  get 'static_pages/orders'

  get 'static_pages/contact'

  get 'static_pages/shop'

  get 'static_pages/index'

  post 'static_pages/thank_you'

  get 'payments/create'

  post 'payments/create'

  get 'order_items/create'

  get 'order_items/update'

  get 'order_items/destroy'

  get 'carts/show'

  get 'carts/checkout'

  get 'orders/index'

  devise_for :users, :controllers => { :registrations => "user_registrations" }
  resources :users
  
  resources :products do
    resources :comments
  end

  resources :comments, only: [:create, :destroy]

  resource :cart, only: [:show]

  resources :order_items, only: [:create, :update, :destroy]

  resources :orders, only: [:index, :show, :create, :destroy]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
