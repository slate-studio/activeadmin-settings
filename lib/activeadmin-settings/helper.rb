module ActiveadminSettings
  module Helpers
    def setting_tag(name)
      Setting.find_or_create_by(name: name).value
    end

    def link_setting_tag(name, html_options={})
      val = Setting.find_or_create_by(name: name).value
      
      if not val.empty? # add regular expression check here
        title, url = val.split(')')
        title.gsub!('(', '').strip!
        url.strip!

        link_to(title, url, html_options)
      end
    end    
  end
end
