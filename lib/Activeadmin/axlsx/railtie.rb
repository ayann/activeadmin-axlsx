module Activeadmin
  module Axlsx
    class Railtie < Rails::Railtie
      # This defines configuration items meant to be overriden
      # in the client application.rb file.
      config.activeadmin_axlsx = ActiveSupport::OrderedOptions.new
      config.activeadmin_axlsx.delete_columns = []
      config.activeadmin_axlsx.per = 200
    end
  end
end
