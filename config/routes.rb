Woldumar::Application.routes.draw do
  resources :camps do 
    resources :sessions
  end

  resources :events do
    resources :occurrences
  end
  resources :donations

  match '/:id(.format)', :to => 'pages#show', :as => :page, :constraints => { :id => /.+/ }

  root :controller => :pages, :action => :show, :id => 'home'
end
