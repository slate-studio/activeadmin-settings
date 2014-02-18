    module ActiveadminSettings
      class Engine < Rails::Engine
        isolate_namespace ActiveadminSettings

        initializer "helper" do |app|
          ActiveSupport.on_load(:action_view) do
            include ActiveadminSettings::Helpers
          end

          ActiveAdmin.before_load do |app|
            app.load_paths << File.expand_path("../../../app/admin", __FILE__)
          end
        end
      end
    end
