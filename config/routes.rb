Bloodbikeswales::Application.routes.draw do
# splash pages
  root 'splash#index'

  get 'about', to: 'splash#about', as: :splash_about
  get 'news', to: 'stories#index', as: :splash_news
  get 'events', to: 'splash#events', as: :splash_events
  get 'sponsors', to: 'splash#sponsors', as: :splash_sponsors
  get 'contact_list', to: 'splash#contact', as: :splash_contact
  get 'links', to: 'splash#links', as: :splash_links
  get 'fundraising', to: 'splash#fundraising', as: :splash_fundraising

  post 'user/:user_id/avatar', to: 'images#create', as: :user_avatar_create
#  post 'story/:story_id/image', to: 'images#story_create', as: :story_image_create


  resources :users, except: :index do
    resources :notifications, only: :index
  end

  resources :recitals
  resources :events
  resources :images

  resources :forums do
    resources :discussions do
      member do
        get 'followers', to: 'discussions#show_followers', as: :show_followers
        get 'create_follower', to: 'discussions#create_follower', as: :create_follower
        get 'delete_follower', to: 'discussions#delete_follower', as: :delete_follower
      end

      resources :replies
    end
  end

  resources :stories, except: [:edit]

  scope path: 'control_panel' do
      get 'pages', to: 'panels#pages', as: :panel_show_pages

      get 'edit_story/:id', to: 'stories#edit', as: :edit_story
      get 'stories', to: 'panels#stories', as: :panel_show_stories

      get 'users', to: 'panels#users', as: :panel_show_users
      delete 'user/:id', to: 'panels#user_delete', as: :delete_user
      patch 'user/:id', to: 'panels#user_update', as: :panel_update_user

      get 'media', to: 'panels#media', as: :panel_show_media
      delete 'media/:id', to: 'panels#media_delete', as: :panel_delete_media
      patch 'media/id', to: 'panels#media_update', as: :panel_update_meda
      
    resources :stories
  end

#  resources :stories

#  get 'panels/users', to: 'panels#users', as: :panel_show_users
#  delete 'panels/user/:id', to: 'panels#user_delete', as: :delete_user
#  patch 'panels/user/:id', to: 'panels#user_update', as: :panel_update_user

#  get 'panels/stories', to: 'panels#stories', as: :panel_show_stories
 # delete 'panels/story/:id', to: 'panels#story_delete', as: :delete_story
 # patch 'panels/story/:id', to: 'panels#story_update', as: :panel_update_story

#  get 'panels/users', to: 'panels#users', as: :panel_show_users
#  delete 'panels/user/:id', to: 'panels#user_delete', as: :delete_user
#  patch 'panels/user/:id', to: 'panels#user_update', as: :panel_update_user


  # use a member route here
  post 'create', to: 'create_reply/:forum_id/:discourse_id', to: 'replies#create'
  post 'create_retort/:forum_id/:discourse_id/:reply_id', to: 'retorts#create', as: :create_reply_retort

  private_dir = 'private'
  get "#{private_dir}/:file_name.:extension", to: 'images#show', as: :private_image

  get 'members_contact_list', to: 'contact_lists#show'

  get 'send_registration_email/:id', to: 'users#send_registration_email', as: :send_registration_email
  get 'culminate/:register_key', to: 'users#culminate', as: :culminate

  get 'signup', to: 'users#new', as: 'sign_up'
  get 'signin', to: 'sessions#new', as: 'sign_in'
  post 'sessions', to: 'sessions#create', as: 'sessions'
  delete 'signout', to: 'sessions#destroy', as: 'sign_out'
end
