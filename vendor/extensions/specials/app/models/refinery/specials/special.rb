module Refinery
  module Specials
    class Special < Refinery::Core::BaseModel
      self.table_name = 'refinery_specials'

      attr_accessible :title, :content, :topic, :position, :topic_id

      acts_as_indexed :fields => [:title, :content]

      validates :title, :presence => true, :uniqueness => true

    end
  end
end
