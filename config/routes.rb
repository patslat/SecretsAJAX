AjaxDemo::Application.routes.draw do
  root :to => "Users#new"

  resource :session
  resources :users do
    resources :secrets, :only => [:new, :create, :destroy]
    resource :friendship, :only => [:create, :destroy]
  end
end
