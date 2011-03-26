Woldumar::Application.routes.draw do
  devise_for :users

  resources :camps do 
    resources :sessions
  end

  resources :events do
    resources :occurrences
  end

  resources :donations
  
  match '/admin(/:action(/:id))', :to => 'admin'

  match '/stylesheets/:package.css', :to => 'assets#stylesheets', :as => 'stylesheet'

  match '/:id(.format)', :to => 'pages#show', :as => :page, :constraints => { :id => /.+/ }
  root :controller => :pages, :action => :show, :id => 'home'
end
