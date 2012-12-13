module Refinery
  module Topics
    class TopicsController < ::ApplicationController

      before_filter :find_all_topics
      before_filter :find_page

      def index
        @topic = Topic.order('position DESC').first
        @specials = Refinery::Specials::Special.where(:topic_id => @topic.id) 
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @topic in the line below:
        present(@page)
      end

      def show
        @topic = Topic.find(params[:id])  
        @specials = Refinery::Specials::Special.where(:topic_id => @topic.id)
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @topic in the line below:
        present(@page)
      end

    protected

      def find_all_topics
        @topics = Topic.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/topics").first
      end

    end
  end
end
