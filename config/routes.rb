ActiveadminSettings::Engine.routes.draw do
  scope "/admin" do
    resources :settings,    :only => [:update]
    resources :admin_users, :only => [:create, :update, :destroy]
  end
end
