module ActiveadminSettings
  module SettingMethods
    def self.included(base)
      base.mount_uploader  :file, ActiveadminSettings::SettingsFileUploader

      # Validators
      base.validates_presence_of   :name
      base.validates_uniqueness_of :name
      base.validates_length_of     :name, minimum: 1

      base.extend ClassMethods
    end


    # Class
    module ClassMethods
      def initiate_setting(name)
        s = self.new(name: name)
        if s.type == "text" or s.type == "html"
          s.string = s.default_value
        end
        s.save
        s
      end
    end


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

  if defined?(Mongoid)
    class Setting
      include Mongoid::Document
      include Mongoid::Timestamps
      include Mongoid::Globalize

      # Fields
      field :name

      translates do
        field :string, :default => ""
        fallbacks_for_empty_translations!
      end

      include SettingMethods

      def self.[](name)
        find_or_create_by(:name => name).value
      end
    end
  else
    class Setting < ActiveRecord::Base
      include SettingMethods
      attr_accessible :name, :string, :file, :remove_file

      def self.[](name)
        find_or_create_by_name(name).value
      end
    end
  end
end
