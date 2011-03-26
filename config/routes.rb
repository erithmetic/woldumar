Woldumar::Application.routes.draw do
  resources :event_registrations

  devise_for :users

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

  match '/stylesheets/:package.css', :to => 'assets#stylesheets', :as => 'stylesheet'

  match '/:id(.format)', :to => 'pages#show', :as => :page, :constraints => { :id => /.+/ }
  root :controller => :pages, :action => :show, :id => 'home'
end
