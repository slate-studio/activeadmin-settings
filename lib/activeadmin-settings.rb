require "activeadmin-settings/version"

module ActiveadminSettings
  require 'activeadmin-settings/engine'
  require 'activeadmin-settings/helper'
  require 'activeadmin-settings/configuration'

  def self.configuration
    @configuration ||= Configuration.load(::Rails.root.join("config/activeadmin_settings.yml"))
  end
end
