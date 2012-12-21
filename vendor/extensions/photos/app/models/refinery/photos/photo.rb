module Refinery
  module Photos
    class Photo < Refinery::Core::BaseModel
      self.table_name = 'refinery_photos'

      attr_accessible :title, :picture_id, :content, :position, :url

      acts_as_indexed :fields => [:title, :content]

      validates :title, :presence => true, :uniqueness => true

      belongs_to :picture, :class_name => '::Refinery::Image'
    end
  end
end
