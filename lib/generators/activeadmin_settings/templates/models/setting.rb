class ActiveadminSettings::Setting
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Reorder

  # Fields
  field           :name
  field           :string, :default => ""
  mount_uploader  :file, SettingsFileUploader

  # Validators
  validates_presence_of   :name
  validates_uniqueness_of :name
  validates_length_of     :name, minimum: 1

  # Indexes
  index :name

  # Instance
  def type
    ActiveadminSettings.settings[name]["type"] ||= "string"
  end

  def description
    ActiveadminSettings.settings[name]["description"] ||= ""
  end

  def default_value
    ActiveadminSettings.settings[name]["default_value"] ||= ""
  end

  def value
    val = respond_to?(type) ? send(type).to_s : send(:string).to_s
    val = default_value if val.empty?
    val.html_safe
  end
end
