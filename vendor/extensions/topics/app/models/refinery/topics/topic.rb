module Refinery
  module Topics
    class Topic < Refinery::Core::BaseModel
      self.table_name = 'refinery_topics'

      attr_accessible :title, :photo_id, :position

      acts_as_indexed :fields => [:title]

      validates :title, :presence => true, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'
      has_many :specials, :class_name => '::Refinery::Special'
    end
  end
end
