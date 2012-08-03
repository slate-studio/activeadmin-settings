class ActiveadminSettings::SettingsFileUploader < CarrierWave::Uploader::Base
  def store_dir
    "system/settings/files/#{model.id}"
  end
end