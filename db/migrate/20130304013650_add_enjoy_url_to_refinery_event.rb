class AddEnjoyUrlToRefineryEvent < ActiveRecord::Migration
  def change
    add_column :refinery_events, :enjoy_url, :string
  end
end
