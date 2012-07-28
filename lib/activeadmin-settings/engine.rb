module ActiveadminSettings
  class Engine < Rails::Engine
    isolate_namespace ActiveadminSettings
    initializer "helper" do |app|
      ActiveSupport.on_load(:action_view) do
        include ActiveadminSettings::Helpers
      end
    end
  end
end
