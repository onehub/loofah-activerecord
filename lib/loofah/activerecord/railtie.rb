require 'rails'
module Loofah::ActiveRecord
  class Railtie < Rails::Railtie
    initializer "loofah-activerecord.initialize" do |app|
      activerecord_railtie = false
      app.railties.each do |railtie|
        activerecord_railtie = true if railtie.class.to_s == "ActiveRecord::Railtie"
      end
      if activerecord_railtie
        require 'loofah/activerecord/active_record'
        require 'loofah/activerecord/xss_foliate'
      end
    end
  end
end
