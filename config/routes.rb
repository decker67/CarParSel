CarParSel::Application.routes.draw do

  get "cargo_list/index"
  get "store/index"
  get "store/search"

  get "mobile/overview"

  resources :storages

  resources :parameters

  resources :postages

  #get 'ebay/create'

  get 'ebay/:id/create' => 'ebay#create'

  get '/car_parts/index_all_parts' => 'car_parts#index_all_parts', as: 'all_car_parts'

  get '/car_parts/print_all_parts' => 'car_parts#print_all_parts', as: 'print_all_parts'

  resources :car_parts

  resources :model_types

  resources :brand_models

  resources :brands

  resources :cars

  resources :sellers

  post '/login' => 'login#login'

  get '/all_models_for_brand' => 'cars#all_models_for_brand', :format => :json
  get '/all_types_for_model' => 'cars#all_types_for_model', :format => :json
  get '/postage_for_postage_id' => 'car_parts#postage_for_postage_id', :format => :json
  get '/toggle_car_part_state' => 'car_parts#toggle_car_part_state', :format => :json

  get "start/overview"

  get 'mobile/overview'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'login#index'
  root 'start#overview'

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
