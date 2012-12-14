# encoding: utf-8
class DownloadsController < ApplicationController
  # before_filter :authenticate 

  def index 
    @files =  Refinery::Resource.where("category = '指南'")  
  end
end