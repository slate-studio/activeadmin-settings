# -*- encoding: utf-8 -*-
require File.expand_path('../lib/activeadmin-settings/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Alex Kravets"]
  gem.email         = ["santyor@gmail.com"]
  gem.description   = "Easy to use general purpose settings backend for activeadmin"
  gem.summary       = ""
  gem.homepage      = "https://github.com/alexkravets/activeadmin-settings"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "activeadmin-settings"
  gem.require_paths = ["lib"]
  gem.version       = ActiveadminSettings::VERSION

  gem.add_runtime_dependency "select2-rails"
  gem.add_runtime_dependency "carrierwave-mongoid"
  gem.add_runtime_dependency "mini_magick"
  gem.add_runtime_dependency "mongoid_globalize"
  gem.add_runtime_dependency "fog"
  gem.add_runtime_dependency "aws-s3"
  gem.add_runtime_dependency "heroku-mongo-backup"
end