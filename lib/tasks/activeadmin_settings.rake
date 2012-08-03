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

    desc "Add settings from activeadmin_settings.yml file to the db"
    task :flush => :environment do
      ActiveadminSettings::Setting.all.destroy
    end
  end
end