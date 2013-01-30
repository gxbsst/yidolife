module Refinery
  module Events
    class Event < Refinery::Core::BaseModel
      self.table_name = 'refinery_events'

      attr_accessible :title, :photo_id, :time, :address,:people_num, :fee, :categroy, :end_time, :description, :is_show, :date_end, :count_url, :position

      acts_as_indexed :fields => [:title, :time, :address, :fee, :categroy, :end_time, :description]

      validates :title, :presence => true, :uniqueness => true

      validates :count_url, :presence => true

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

     def time_end
     	time_end = (end_time - Time.now)/3600/24
     	if time_end <=  0
     		time_end = 0
     	else
            time_end
     	end 
     end

    end
  end
end
