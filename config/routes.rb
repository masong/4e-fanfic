Fanfic::Application.routes.draw do
  get "home/index"

  match '/stories/current' => 'stories#current'
  match '/stories/take_control' => 'stories#take_control'
  match '/stories/save' => 'stories#save'

  match '/admin/' => 'admin#index'
  match '/admin/create_story' => 'admin#create_story'
  match '/admin/activate_story' => 'admin#activate_story'
  match '/admin/deactivate_story' => 'admin#deactivate_story'
  match '/admin/hide_story' => 'admin#hide_story'

  match '/users/add_alerts' => 'users#add_alerts'
  match '/users/remove_alerts' => 'users#remove_alerts'
  match '/users/register' => 'users#register'
  match '/users/deregister' => 'users#deregister'

  match '/about/' => 'about#index'

  resources :stories do
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
  root :to => 'stories#current'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
