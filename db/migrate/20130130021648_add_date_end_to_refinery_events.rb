class AddDateEndToRefineryEvents < ActiveRecord::Migration
  def change
    add_column :refinery_events, :date_end, :integer
  end
end
