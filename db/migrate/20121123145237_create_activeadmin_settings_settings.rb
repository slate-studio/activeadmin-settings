class CreateActiveadminSettingsSettings < ActiveRecord::Migration
  def change
    create_table :activeadmin_settings_settings do |t|
      t.string :name
      t.text :string
      t.string :file

      t.timestamps
    end
  end
end
