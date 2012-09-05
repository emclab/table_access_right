TableAccessRight::Application.routes.draw do
  get "sys_position_and_groups/index"

  get "sys_position_and_groups/new"

  get "sys_position_and_groups/create"

  get "sys_position_and_groups/edit"

  get "sys_position_and_groups/update"

  get "sys_position_and_groups/destroy"

  get "sys_modules/index"

  get "sys_modules/new"

  get "sys_modules/create"

  get "sys_modules/edit"

  get "sys_modules/update"

  get "sys_modules/destroy"

  get "sys_user_rights/index"

  get "sys_user_rights/new"

  get "sys_user_rights/create"

  get "sys_user_rights/destroy"

  get "sys_action_on_tables/index"

  get "sys_action_on_tables/new"

  get "sys_action_on_tables/create"

  get "sys_action_on_tables/edit"

  get "sys_action_on_tables/update"

  get "sys_action_on_tables/destroy"

  get "main_menus/index"

  get "sys_user_positions/index"

  get "sys_user_positions/new"

  get "sys_user_positions/create"

  get "sys_user_positions/edit"

  get "sys_user_positions/update"
  
  #get "sys_user_positions/destroy"
  
  resources :sys_user_positions
  resources :sys_action_on_tables
  resources :sys_modules
  resources :sys_position_and_groups
  resources :sys_user_rights do
    collection do
      get 'search' 
      put 'search_results'
    end
  end

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
    root :to => "main_menus#index"
end
