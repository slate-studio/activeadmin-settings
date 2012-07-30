ActiveAdmin.register ActiveadminSettings::Setting, :as => "Setting" do
  menu :parent => "Settings", :priority  => 1, :label => "General"

  actions  :index, :update, :destroy
  
  controller do
    def update
      update! do |format|
        format.html { render :text => resource.value }
      end
    end
  end

  index :as => :reorder_table do
    column :name do |s|
      "<strong>#{s.name}</strong><br/><em>#{s.description}</em>".html_safe
    end
    
    column :value do |s|
      render :partial => "value", :locals => {:setting => s}
    end

    column "" do |s|
      link_to("Update", "#", :class => "member_link update_setting_link", "data-setting-id" => s.id)
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :type
      f.input :description
      f.input :string
    end

    f.buttons
  end

  collection_action :reorder, :method => :put do
    render :text => resource_class.reorder_objects(params[:ids])
  end
end
