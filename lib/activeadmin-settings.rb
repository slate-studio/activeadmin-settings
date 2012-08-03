require "activeadmin-settings/version"

module ActiveadminSettings
  require 'activeadmin-settings/engine'
  require 'activeadmin-settings/helper'

  def self.load_config
    config_file = ::Rails.root.join("config/activeadmin_settings.yml")
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
      @groups << { :name     => key,
                  :slug     => key.downcase.gsub(" ", "_"),
                  :default_settings => settings,
                  :settings => [] }
    end
    @groups
  end
end
