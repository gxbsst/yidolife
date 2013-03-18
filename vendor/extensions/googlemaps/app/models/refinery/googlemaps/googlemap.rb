module Refinery
  module Googlemaps
    class Googlemap < Refinery::Core::BaseModel
      self.table_name = 'refinery_googlemaps'

      attr_accessible :event_id, :address, :longitude, :latitude, :position

      acts_as_indexed :fields => [:address]

      validates :address, :presence => true

      before_save :update_store_tuge


      ## 更新店地址经纬度
      def update_store_tuge
      		tuge = Geocoder.coordinates(self.address)

      		if tuge.present?
	      		self.longitude = tuge[0]
	      		self.latitude = tuge[1]
	      	end
      		# update_column(:longitude, tuge[0])
      		# update_column(:latitude, tuge[1])
      		# self.update_attributes(:longitude => tuge[0], :latitude => tuge[1]) 
      		# unless self.address.blank?
            # self.update_attributes(:longitude => tuge[0], :latitude => tuge[1]) unless tuge.blank?
      end

    end
  end
end
