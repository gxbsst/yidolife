# encoding: UTF-8
module Refinery
  module Events
    class Event < Refinery::Core::BaseModel
      self.table_name = 'refinery_events'

      attr_accessible :title, :photo_id, :start_time, :over_time, :address, :fee, :categroy, :maker, :description, :is_show, :position

      acts_as_indexed :fields => [:title, :address, :fee, :categroy, :maker, :description]

      validates :title, :presence => true, :uniqueness => true
      validate :time_validation

      belongs_to :photo, :class_name => '::Refinery::Image'
      after_save :update_is_show

      def update_is_show
       if is_show.present?
        #TODO
        # 取消之前选择
        old_events = self.class.where(["id !=? ", id])

         unless old_events.blank?
            old_events.each do |event|
              event.update_column(:is_show, 0)          
            end 
   
         end
       end  
      end

      def time_validation
        if start_time.present?
        start = start_time.strftime("%Y-%m-%d %H:%M:%S") 
        over = over_time.strftime("%Y-%m-%d %H:%M:%S")
        if start >= over
          errors.add(:time_validate,"活动结束时间不能小于等于活动开始时间")
        end 
        end 
      end

   
    end
  end
end
