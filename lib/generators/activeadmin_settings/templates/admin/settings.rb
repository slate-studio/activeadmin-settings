ActiveAdmin.register_page "Settings" do

  menu label: ActiveadminSettings::Setting.model_name.human

  content title: ActiveadminSettings::Setting.model_name.human do    
    # Mergin db settings objects and default values
    # from config/activaadmin_settings.yml file.

    all_settings  = {}
    ActiveadminSettings::Setting.all.each do |setting|
      locale = setting.locale || I18n.default_locale
      if all_settings[setting.name]
        all_settings[setting.name][locale] = setting
      else
        all_settings[setting.name] = { locale => setting }
      end
    end

    groups = ActiveadminSettings.groups
    groups.each do |group|
      group[:default_settings].each_key do |name|
        settings_hash = all_settings[name]
        if settings_hash and !settings_hash.empty?
          # select existing settings filtering by available locales
          settings = settings_hash.select{ |(k, _)| I18n.available_locales.include?(k.to_sym) }.values
          # add new settings for missing locales
          (I18n.available_locales - settings_hash.keys.map(&:to_sym)).each do |locale|
            settings << ActiveadminSettings::Setting.initiate_setting(name, locale)
          end
        else  
          settings = []
          # add settings for available locales
          I18n.available_locales.each do |locale|
            ActiveadminSettings::Setting.initiate_setting(name, locale)
          end
        end
        group[:settings] += settings
      end
    end

    render  :partial  => "index",
            :locals   => { :admins => AdminUser.all,
                           :groups => groups }
  end
end