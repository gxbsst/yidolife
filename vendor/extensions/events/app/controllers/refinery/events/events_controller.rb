module Refinery
  module Events
    class EventsController < ::ApplicationController
      
      require "net/http"
      require "uri"
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


        uri = URI.parse(@event.count_url)   
        http = Net::HTTP.new(uri.host, uri.port)                                        
        http.use_ssl = true                                                             
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE                                    
                                                                               
        request = Net::HTTP::Get.new(uri.request_uri)                                   
        request.basic_auth(EVENT['name'], EVENT['password'])                             
                                                            
        response = http.request(request)                                                
        JSON.parse(response.body)  
        
        @people_num = JSON.parse(response.body)["EntryCount"]

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
