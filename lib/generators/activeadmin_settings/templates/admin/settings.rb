ActiveAdmin.register_page "Settings" do
  content do    
    # Mergin db settings objects and default values
    # from config/activaadmin_settings.yml file.

    all_settings  = {}
    ActiveadminSettings::Setting.all.each do |s|
      all_settings[s.name] = s
    end

    groups = ActiveadminSettings.groups
    groups.each do |g|
      g[:default_settings].each_key do |name|
        s = all_settings[name]
        unless s
          s = ActiveadminSettings::Setting.initiate_setting(name)
        end
        g[:settings] << s 
      end
    end

    render  :partial  => "index",
            :locals   => { :admins   => AdminUser.all,
                           :groups   => groups}
  end
end