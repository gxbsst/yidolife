module Refinery
  module Events
    class EventsController < ::ApplicationController

      before_filter :find_all_events
      before_filter :find_page

      def index
        @events =  Event.where("is_show = 0").order('position DESC, created_at ASC')
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @event in the line below:
        present(@page)
      end

      def show
        @event = Event.find(params[:id])
        @events = Event.where("is_show = 0").order('position DESC, created_at ASC').limit(4)
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @event in the line below:
        present(@page)
      end

    protected

      def find_all_events
        @event = Event.where("is_show = 1").order('position DESC, created_at ASC').first
        if @event.blank?
          @event = Event.where("is_show = 0").order('position DESC, created_at ASC').first
        end
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/events").first
      end

    end
  end
end
