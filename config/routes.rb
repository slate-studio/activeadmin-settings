ActiveadminSettings::Engine.routes.draw do
  resources :settings,    :only => [:update]
  resources :admin_users, :only => [:create, :update, :destroy]
end
