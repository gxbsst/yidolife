class AddIsRecentToRefineryEvent < ActiveRecord::Migration
  def change
    add_column :refinery_events, :is_recent, :integer
  end
end
