module Refinery
  module Googlemaps
    class GooglemapsController < ::ApplicationController

      before_filter :find_all_googlemaps
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @googlemap in the line below:
        present(@page)
      end

      def show
        @googlemap = Googlemap.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @googlemap in the line below:
        present(@page)
      end

    protected

      def find_all_googlemaps
        @googlemaps = Googlemap.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/googlemaps").first
      end

    end
  end
end
