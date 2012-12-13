module Refinery
  module Partners
    class Partner < Refinery::Core::BaseModel
      self.table_name = 'refinery_partners'

      attr_accessible :title, :photo_id, :url, :position

      acts_as_indexed :fields => [:title, :url]

      validates :title, :presence => true, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'
    end
  end
end
