module ActiveadminSettings
  module Helpers
    def string_setting_tag(name, value, description="")
      return "Error: Option name is required." if name.empty?

      params = { :type => :string, :name => name, :string => value, :description => description }
      Setting.get_or_create(params)
    end

    def file_setting_tag(name, default_value="", description="")
      return "Error: Option name is required." if name.empty?
      
      params = { :type => :file, :name => name, :string => default_value, :description => description }
      Setting.get_or_create(params)
    end
  end
end
