module Refinery
  module Topics
    module Admin
      class TopicsController < ::Refinery::AdminController

        crudify :'refinery/topics/topic', :xhr_paging => true

      end
    end
  end
end
