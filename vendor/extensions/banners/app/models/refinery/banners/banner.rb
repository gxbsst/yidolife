module Refinery
  module Banners
    class Banner < Refinery::Core::BaseModel
      self.table_name = 'refinery_banners'

      attr_accessible :title, :picture_id, :position

      acts_as_indexed :fields => [:title]

      validates :title, :presence => true, :uniqueness => true

      belongs_to :picture, :class_name => '::Refinery::Image'
    end
  end
end
