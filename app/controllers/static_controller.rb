# encoding: utf-8
class StaticController < ApplicationController
	before_filter :find_all_stories
 
  def aboutus
  	@recent_events = Refinery::Events::Event.where("is_recent = 1").order('position DESC, created_at ASC').limit(4)
  end
  def contact
  	@recent_events = Refinery::Events::Event.where("is_recent = 1").order('position DESC, created_at ASC').limit(4)
  end
  def donation
  	@recent_events = Refinery::Events::Event.where("is_recent = 1").order('position DESC, created_at ASC').limit(4)
  end
  def report
  	@story = Refinery::Stories::Story.order('position ASC').first
  end
 

  protected

      def find_all_stories
        @stories = Refinery::Stories::Story.order('position ASC')
      end 
 
end