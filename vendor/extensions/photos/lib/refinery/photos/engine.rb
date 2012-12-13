module Refinery
  module Photos
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Photos

      engine_name :refinery_photos

      initializer "register refinerycms_photos plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "photos"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.photos_admin_photos_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/photos/photo'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Photos)
      end
    end
  end
end
