Woldumar::Application.routes.draw do
  # Authentication
  devise_for :users

  # Standard resources
  resources :session_registrations, :event_registrations, :donations

  # User-facing camps controller routes
  match '/activities/summer_camps', :to => "Camps#all", :as => :all_camps
  match '/activities/summer_camps/:id', :to => "Camps#one", :as => :one_camp

  # Nested resources
  scope '/admin' do
    resources :camps do 
      resources :sessions
    end
  end

  resources :events do
    collection do
      get :upcoming
    end
    resources :event_registrations
  end

  # Custom controller for Authorize.Net stuff
  match '/admin/authorize_net_credentials/edit', :to => "AuthorizeNetCredentials#edit", :as => :authorize_net_credentials_edit
  match '/admin/authorize_net_credentials', :to => "AuthorizeNetCredentials#update", :as => :authorize_net_credentials

  # Admin interface (mostly for User model)
  match '/admin(/:action(/:id))', :to => 'Admin'

  # Assets controller
  match '/stylesheets/:package.css', :to => 'Assets#index', :as => 'stylesheet', :type => :css
  match '/javascripts/:package.js', :to => 'Assets#index', :as => 'javascript', :type => :js

  # Pages (rest of site)
  match '/:id(.format)', :to => 'Pages#show', :as => :page, :constraints => { :id => /.+/ }
  root :to => 'Pages#show', :id => 'home'
end
