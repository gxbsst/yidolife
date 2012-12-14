module Refinery
  module Feedbacks
    class FeedbacksController < ::ApplicationController

      before_filter :find_all_feedbacks
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @feedback in the line below:
        present(@page)
      end

      def show
        @feedback = Feedback.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @feedback in the line below:
        present(@page)
      end

    protected

      def find_all_feedbacks
        @feedbacks = Feedback.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/feedbacks").first
      end

    end
  end
end
