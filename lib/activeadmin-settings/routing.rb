module ActionDispatch::Routing
  class Mapper
    def mount_activeadmin_settings
      scope '/admin', :module => "activeadmin_settings", as: 'admin' do
        scope "redactor" do
          resources :pictures,  :only => [:index, :create]
        end
        resources :settings,    :only => [:update]
        resources :admin_users, :only => [:create, :update, :destroy]
      end
    end
  end
end
