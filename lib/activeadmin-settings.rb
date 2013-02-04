require "activeadmin-settings/version"

module ActiveadminSettings
  def self.table_name_prefix
    'activeadmin_settings_'
  end

  require 'activeadmin-settings/engine'
  require 'activeadmin-settings/helper'
  require 'activeadmin-settings/routing'

  IMAGE_TYPES = [ 'image/jpeg',
                  'image/png',
                  'image/gif',
                  'image/jpg',
                  'image/pjpeg',
                  'image/tiff',
                  'image/x-png' ]

  mattr_accessor :image_file_types
  @@image_file_types = ["jpg", "jpeg", "png", "gif", "tiff"]
  
  mattr_accessor :config_file
  @@config_file = "config/activeadmin_settings.yml"

  # Load configuration from config/activeadmin_settings.yml
  def self.load_config
    config_file = ::Rails.root.join(@@config_file)
    @load_config = {}

    if File.exists?(config_file)
      data = YAML::load(ERB.new(IO.read(config_file)).result)
      @load_config = data if data
    end
    @load_config
  end

  def self.all_settings
    @all_settings = {}
    load_config.each do |key, settings|
      @all_settings.merge!(settings)
    end
    @all_settings
  end

  def self.groups
    @groups = []
    load_config.each do |key, settings|
      @groups << {:name     => key,
                  :slug     => key.downcase.gsub(" ", "_"),
                  :default_settings => settings,
                  :settings => [] }
    end
    @groups
  end
end
