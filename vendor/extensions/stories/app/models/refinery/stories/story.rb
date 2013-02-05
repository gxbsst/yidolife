module Refinery
  module Stories
    class Story < Refinery::Core::BaseModel
      self.table_name = 'refinery_stories'

      attr_accessible :title, :time, :content, :position

      acts_as_indexed :fields => [:title, :content]

      validates :title, :presence => true, :uniqueness => true

      has_one :gallery, :class_name => 'Refinery::Portfolio::Gallery'
    end
  end
end
