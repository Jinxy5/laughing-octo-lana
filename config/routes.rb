Bloodbikeswales::Application.routes.draw do
  

  resources :users
  resources :recitals
  resources :events
  resources :images


  resources :forums do
    resources :discourses do
      resources :replies
    end
  end

  # use a member route here
  post 'create', to: 'create_reply/:forum_id/:discourse_id', to: 'replies#create'

  get 'uploads/:file_name.:extension', to: 'images#show'

  root 'splash#index'

  get 'culminate/:register_key', to: 'users#culminate', as: :culminate
  get 'signup', to: 'users#new', as: 'sign_up'
  get 'signin', to: 'sessions#new', as: 'sign_in' # sign_in
  post 'sessions', to: 'sessions#create', as: 'sessions' #machine_link
  delete 'signout', to: 'sessions#destroy', as: 'sign_out' # sign_out

   
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
