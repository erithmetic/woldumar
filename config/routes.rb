Woldumar::Application.routes.draw do
  devise_for :users

  resources :session_registrations
  resources :event_registrations

  resources :camps do 
    resources :sessions
  end

  resources :events do
    collection do
      get :upcoming
    end
    resources :event_registrations
  end

  resources :donations
  
  match '/admin(/:action(/:id))', :to => 'admin'

  match '/stylesheets/:package.css', :to => 'assets#index', :as => 'stylesheet', :type => :css
  match '/javascripts/:package.js', :to => 'assets#index', :as => 'javascript', :type => :js

  match '/:id(.format)', :to => 'pages#show', :as => :page, :constraints => { :id => /.+/ }
  root :to => 'pages#show', :id => 'home'
end
