module ActiveadminSettings
  module Helpers
    def setting_tag(name)
      Setting.find_or_create_by(name: name).value
    end    
  end
end
