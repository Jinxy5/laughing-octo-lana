Bloodbikeswales::Application.routes.draw do
  

  resources :users
  resources :recitals
  resources :events


  resources :forums do
    resources :discussions do
      resources :posts
    end
  end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'splash#index'


  get 'forums/:forum_id/discussion/:discusssion_id', to: 'discussions#show', as: :show_discussion

   get 'culminate/:register_key', to: 'users#culminate', as: :culminate

   get 'signup', to: 'users#new', as: 'sign_up'

   get 'signin', to: 'sessions#new', as: 'sign_in' # sign_in
   post 'sessions', to: 'sessions#create', as: 'sessions' #machine_link
   delete 'signout', to: 'sessions#destroy', as: 'sign_out' # sign_out

   
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
