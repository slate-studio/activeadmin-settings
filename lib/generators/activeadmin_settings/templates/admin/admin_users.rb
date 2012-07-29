ActiveAdmin.register AdminUser, :as => "Admin" do
  menu :parent => "Settings", :priority  => 2

  index do
    column :email
    default_actions
  end

  show :title => :email do
    panel("Admin Details") do
      attributes_table_for resource, :id, :email
    end
  end

  form do |f|
    f.inputs "Credentials" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.buttons
  end
end