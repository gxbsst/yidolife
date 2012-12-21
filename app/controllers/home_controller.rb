# encoding: utf-8
class HomeController < ApplicationController
 
  def index
     @event = Refinery::Events::Event.where("is_show = 1").order('position ASC, created_at DESC').limit(1)  
     @photos = Refinery::Photos::Photo.order('position ASC, created_at DESC').limit(3)
     @banners = Refinery::Banners::Banner.order('position ASC, created_at DESC')
     render :layout => false
  end

end