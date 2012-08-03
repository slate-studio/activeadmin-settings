class ActiveadminSettings::Setting
  include Mongoid::Document
  include Mongoid::Timestamps

  # Fields
  field           :name
  field           :string, :default => ""
  mount_uploader  :file, ActiveadminSettings::SettingsFileUploader

  # Validators
  validates_presence_of   :name
  validates_uniqueness_of :name
  validates_length_of     :name, minimum: 1

  # Indexes
  index :name

  # Instance
  def type
    (ActiveadminSettings.all_settings[name]["type"] ||= "string").to_s
  end

  def description
    (ActiveadminSettings.all_settings[name]["description"] ||= "").to_s
  end

  def default_value
    val = (ActiveadminSettings.all_settings[name]["default_value"] ||= "").to_s
    
    if type == "file" and not val.include? '//'
      val = ActionController::Base.helpers.asset_path(val)
    end
    
    val
  end

  def value
    val = respond_to?(type) ? send(type).to_s : send(:string).to_s
    val = default_value if val.empty?
    val.html_safe
  end
end
