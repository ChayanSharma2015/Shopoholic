Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :users, :controllers => {:registrations => "user/registrations"}
  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :carts
  resources :discounted_sales
  resources :discounted_products
  resources :product_categories
  resources :products
  resources :addresses

  root 'products#index'
  get  'order/create'
  get  'user/profile'
  get  'sessions/new'
  get  'generate/controller'
  get  'generate/order'
  get  'generate/cretae'
  get  'myCart'               => 'sessions#myCart'
  get  'add_to_cart'          => 'sessions#add_to_cart'
  get  'add_quantity'         => 'sessions#add_quantity'
  get  'deduct_quantity'      => 'sessions#deduct_quantity'
  get  'remove_cart'          => 'sessions#remove_cart'
  get  'delivery_address'     => 'sessions#delivery_address'
  get  'place_order'          => 'sessions#place_order'
  post 'add_delivery_address' => 'sessions#add_delivery_address'
  post '/hook'                => 'order#hook'
  get  '/order_receipt'       => 'order#order_receipt'
  get  '/purchased_orders'    => 'order#purchased_orders'



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