module Refinery
  module Stories
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Stories

      engine_name :refinery_stories

      initializer "register refinerycms_stories plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "stories"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.stories_admin_stories_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/stories/story'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Stories)
      end
    end
  end
end
