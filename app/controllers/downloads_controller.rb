# encoding: utf-8
class DownloadsController < ApplicationController
  # before_filter :authenticate
  http_basic_authenticate_with :name => "media.yido", :password => "yidolife", :realm => "Yido"

  def index 
    @files =  Refinery::Resource.where("category = '指南'")  
  end
end