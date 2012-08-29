# -*- encoding: utf-8 -*-
require File.expand_path('../lib/activeadmin-settings/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "activeadmin-settings"
  gem.version       = ActiveadminSettings::VERSION
  gem.authors       = ["Alex Kravets"]
  gem.email         = ["santyor@gmail.com"]
  gem.homepage      = "https://github.com/alexkravets/activeadmin-settings"
  gem.description   = "Easy to use general purpose settings backend for activeadmin"
  gem.summary       = ""

  gem.require_paths = ["lib"]
  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})

  # WARNING: These could be mongoid version specific gems
  gem.add_runtime_dependency "carrierwave-mongoid"
  gem.add_runtime_dependency "mongoid_globalize"

  # Latest version of select2-rails seems to be not working for some reason
  gem.add_runtime_dependency "select2-rails"

  # Images uploading via redactor support
  gem.add_runtime_dependency "mini_magick"
  gem.add_runtime_dependency "aws-s3"
  gem.add_runtime_dependency "fog"
end