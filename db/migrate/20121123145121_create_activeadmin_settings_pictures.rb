class CreateActiveadminSettingsPictures < ActiveRecord::Migration
  def change
    create_table :activeadmin_settings_pictures do |t|
      t.string :data
      t.string :data_file_size
      t.string :data_content_type
      t.integer :width
      t.integer :height

      t.timestamps
    end
  end
end
