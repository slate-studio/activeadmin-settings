class AddLocaleToActiveadminSettingsSettings < ActiveRecord::Migration
  def change
    add_column :activeadmin_settings_settings, :locale, :string 
  end
end