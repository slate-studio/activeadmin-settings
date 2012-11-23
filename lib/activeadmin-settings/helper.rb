module ActiveadminSettings
  module Helpers
    def settings_value(name)
      Setting[name]
    end

    def settings_link_value(name, html_options={})
      val = Setting[name]

      if not val.empty? # add regular expression check here
        title, url = val.split(')')
        title.gsub!('(', '').strip!
        url.strip!

        link_to(title, url, html_options)
      end
    end

    module_function :settings_value, :settings_link_value
  end
end

