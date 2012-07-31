module ActiveadminSettings
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc << "Description:\n    Copies source files to your application's app directory and required gems."

      source_root File.expand_path('../templates', __FILE__)

      def copy_files
        # models
        puts "Installing models:"
        copy_file "models/setting.rb", "app/models/activeadmin_settings/setting.rb"

        # uploaders
        puts "Installing uploaders:"
        copy_file "uploaders/settings_file_uploader.rb", "app/uploaders/settings_file_uploader.rb"

        # admin
        puts "Installing admin:"
        copy_file "admin/admin_users.rb", "app/admin/admin_users.rb"
        copy_file "admin/settings.rb",    "app/admin/settings.rb"

        # config
        puts "Installing config:"
        copy_file "config/activeadmin_settings.yml", "config/activeadmin_settings.yml"
      end

      def mount_engine
        route "mount ActiveadminSettings::Engine => '/admin'"
      end

      def add_assets
        if File.exist?('app/assets/javascripts/active_admin.js')
          insert_into_file  "app/assets/javascripts/active_admin.js",
                            "//= require activeadmin_settings\n", :after => "base\n"
        else
          puts "It doesn't look like you've installed activeadmin: active_admin.js is missing.\nPlease install it and try again."
        end

        if File.exist?('app/assets/stylesheets/active_admin.css.scss')
          insert_into_file  "app/assets/stylesheets/active_admin.css.scss",
                            "//= require activeadmin_settings\n", :before => "// Active Admin CSS Styles\n"
        else
          puts "It doesn't look like you've installed activeadmin: active_admin.scss is missing.\nPlease install it and try again."
        end
      end

      def add_gems
        gem "activeadmin-mongoid-reorder"
      end
    end
  end
end
