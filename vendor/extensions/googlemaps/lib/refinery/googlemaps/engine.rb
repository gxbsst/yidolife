module Refinery
  module Googlemaps
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Googlemaps

      engine_name :refinery_googlemaps

      initializer "register refinerycms_googlemaps plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "googlemaps"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.googlemaps_admin_googlemaps_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/googlemaps/googlemap',
            :title => 'address'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Googlemaps)
      end
    end
  end
end
