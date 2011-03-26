Woldumar::Application.routes.draw do
  resources :camps

  resources :events do
    resources :occurrences
  end
  resources :donations
end
