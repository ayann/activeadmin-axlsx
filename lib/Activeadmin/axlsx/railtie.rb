module Activeadmin
  module Axlsx
    class Railtie < Rails::Railtie
      # This defines configuration items meant to be overriden
      # in the client application.rb file.
      config.activeadmin_axlsx = ActiveSupport::OrderedOptions.new
    end
  end
end
