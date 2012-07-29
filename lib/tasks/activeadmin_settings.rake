# encoding: UTF-8

namespace :activeadmin do
  desc "Create default admin user"
  task :create_admin => :environment do
    AdminUser.create :email => 'admin@example.com', :password => 'password', :password_confirmation => 'password'
    puts "New admin user created:
            email: admin@example.com
            password: password"
  end
end