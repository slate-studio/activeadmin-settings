# encoding: UTF-8

namespace :activeadmin do
  desc "Create default admin user"
  task :create_admin => :environment do
    AdminUser.create :email => 'admin@example.com', :password => 'password', :password_confirmation => 'password'
    puts "New admin user created:
            email: admin@example.com
            password: password"
  end

  desc "Add missing settings from activeadmin_settings.yml file to the db"
  task :add_settings => :environment do
    ActiveadminSettings.all_settings.each_key |name|
      Setting.find_or_create_by(name: name)
    end
  end

  desc "Add settings from activeadmin_settings.yml file to the db"
  task :flush_settings => :environment do
    ActiveadminSettings::Setting.all.destroy
  end
end