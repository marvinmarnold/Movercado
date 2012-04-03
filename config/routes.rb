Movercado::Application.routes.draw do
  resources :sales_data

  resources :mc_data

  resources :app_vars
  resources :message_phone_connections
  resources :message_tag_connections
  resources :tags
  resources :user_app_vars
  resources :actor_codes
  resources :messages
  resources :phones
  resources :users
  resources :apps

  root :to => 'messages#index'
  match '/kannel_start_point', :to => "messages#kannel_start_point"
  match '/created_codes', :to => "actor_codes#listing"
  
  
  match '/export_messages',				:to => 'messages#export'
  
  resources :voucher_request_apps, :controller => "apps", :type => "VoucherRequestApp"
  resources :voucher_redemption_apps, :controller => "apps", :type => "VoucherRedemptionApp"
  resources :data_collector_apps, :controller => "apps", :type => "DataCollectorApp"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
