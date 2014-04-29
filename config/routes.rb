Bloodbikeswales::Application.routes.draw do
# splash pages
  root 'splash#index'

  get 'about', to: 'splash#about', as: :splash_about
  get 'news', to: 'stories#index', as: :splash_news
  get 'events', to: 'splash#events', as: :splash_events
  get 'sponsors', to: 'splash#sponsors', as: :splash_sponsors
  get 'contact_list', to: 'splash#contact', as: :splash_contact
  get 'links', to: 'splash#links', as: :splash_links

  post 'user/:user_id/avatar', to: 'images#create', as: :user_avatar_create


  resources :users, except: :index
  
  resources :recitals
  resources :events
  resources :images

  resources :forums do
    resources :discussions do
      member do
        get 'followers', to: 'discussions#show_followers', as: :followers
      end

      resources :replies
    end
  end

#  resources :stor
  scope '/panels' do
      resources :stories
      get '/stories/:id', to: 'panels_controller#stories', as: :panel_stories

  end 
  resources :stories

  get 'panels/users', to: 'panels#users', as: :panel_show_users
  delete 'panels/user/:id', to: 'panels#user_delete', as: :delete_user
  patch 'panels/user/:id', to: 'panels#user_update', as: :panel_update_user

#  get 'panels/stories', to: 'panels#stories', as: :panel_show_stories
 # delete 'panels/story/:id', to: 'panels#story_delete', as: :delete_story
 # patch 'panels/story/:id', to: 'panels#story_update', as: :panel_update_story

#  get 'panels/users', to: 'panels#users', as: :panel_show_users
#  delete 'panels/user/:id', to: 'panels#user_delete', as: :delete_user
#  patch 'panels/user/:id', to: 'panels#user_update', as: :panel_update_user


  # use a member route here
  post 'create', to: 'create_reply/:forum_id/:discourse_id', to: 'replies#create'
  post 'create_retort/:forum_id/:discourse_id/:reply_id', to: 'retorts#create', as: :create_reply_retort
  get 'uploads/:file_name.:extension', to: 'images#show'

  get 'members_contact_list', to: 'contact_lists#show'

  get 'send_registration_email/:id', to: 'users#send_registration_email', as: :send_registration_email
  get 'culminate/:register_key', to: 'users#culminate', as: :culminate

  get 'signup', to: 'users#new', as: 'sign_up'
  get 'signin', to: 'sessions#new', as: 'sign_in'
  post 'sessions', to: 'sessions#create', as: 'sessions'
  delete 'signout', to: 'sessions#destroy', as: 'sign_out'
end
