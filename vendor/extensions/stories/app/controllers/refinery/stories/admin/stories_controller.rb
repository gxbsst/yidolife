module Refinery
  module Stories
    module Admin
      class StoriesController < ::Refinery::AdminController

        crudify :'refinery/stories/story', :xhr_paging => true

      end
    end
  end
end
