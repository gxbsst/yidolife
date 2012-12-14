module Refinery
  module Feedbacks
    module Admin
      class FeedbacksController < ::Refinery::AdminController

        crudify :'refinery/feedbacks/feedback', :xhr_paging => true

      end
    end
  end
end
