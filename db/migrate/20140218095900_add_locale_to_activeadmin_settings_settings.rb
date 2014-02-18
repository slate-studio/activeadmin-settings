class AddLocaleToActiveadminSettingsSettings < ActiveRecord::Migration
  def up
    add_column :activeadmin_settings_settings, :locale, :string

    ActiveadminSettings::Setting.update_all("locale = '#{ I18n.default_locale }'") 
  end

  def down
    remove_column :activeadmin_settings_settings, :locale
  end
end