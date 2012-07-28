require "activeadmin-settings/version"

module ActiveadminSettings
  require 'activeadmin-settings/engine'
  require 'activeadmin-settings/helper'

  def self.settings
    config_file = ::Rails.root.join("config/activeadmin_settings.yml")
    @settings = {}
    
    if File.exists?(config_file)
      data = YAML::load(ERB.new(IO.read(config_file)).result)
      @settings = data if data
    end
  end
end
