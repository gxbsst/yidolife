# encoding: utf-8
class DownloadsController < ApplicationController
  # before_filter :authenticate
  http_basic_authenticate_with :name => "media.yido", :password => "yidolife", :realm => "Yido"

  def index
    @files = Refinery::Resource.where("media_type = '新闻通稿'")
    @images_poster =  Refinery::Resource.where("media_type = '高清图片'")    
  end
end