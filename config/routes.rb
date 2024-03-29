SampleApp::Application.routes.draw do # Routes corresponds URIs and webpages.
  resources :users #ensures rails application responds to RESTful URIs
  resources :sessions, only: [:new, :create, :destroy] #there is no need to edit or show sessions. New is to start a session, create is to make the session (add cookies), and destroy is for sign out

  match '/signup',  to: 'users#new' #matches URI to action 'new' in controller 'users'
  match '/signin',  to: 'sessions#new' #matches URI to action 'new' in controller 'sessions'
  match '/signout', to: 'sessions#destroy', via: :delete #matches URI to action 'destroy' in controller 'sessions'. via: :delete matches this to the HTTP command DELETE
  match '/help',    to: 'static_pages#help' #matches URI to action 'help' in controller 'static_pages'
  match '/about',   to: 'static_pages#about' #matches URI to action 'about' in controller 'static_pages'
  match '/contact', to: 'static_pages#contact' #matches URI to action 'contact' in controller 'static_pages'
  
  root to: 'static_pages#home' #at root go to action 'home' in model 'static_pages'


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
