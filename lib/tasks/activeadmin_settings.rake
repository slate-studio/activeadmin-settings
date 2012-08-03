# encoding: UTF-8

namespace :activeadmin do
  namespace :settings do
    desc "Create default admin user"
    task :create_admin => :environment do
      AdminUser.create :email => 'admin@example.com', :password => 'password', :password_confirmation => 'password'
      puts "New admin user created:
              email: admin@example.com
              password: password"
    end

    desc "Add missing settings from activeadmin_settings.yml file to the db"
    task :add => :environment do
      ActiveadminSettings.all_settings.each_key do |name|
        puts "Add setting: #{name}"
        s = ActiveadminSettings::Setting.find_or_create_by(name: name)
        
        # Save default text values to db,
        # as this way it's more easy to edit them
        if s.type == "text" or s.type == "html"
          s.string = s.default_value
          s.save
        end
      end
    end

    desc "Add settings from activeadmin_settings.yml file to the db"
    task :flush => :environment do
      ActiveadminSettings::Setting.all.destroy
    end
  end
end