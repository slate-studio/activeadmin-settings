ActiveadminSettings::Engine.routes.draw do
  scope "redactor" do
    resources :pictures,    :only => [:index, :create]
  end
  resources :settings,    :only => [:update]
  resources :admin_users, :only => [:create, :update, :destroy]
end
