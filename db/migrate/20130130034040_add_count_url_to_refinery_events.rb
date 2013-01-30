class AddCountUrlToRefineryEvents < ActiveRecord::Migration
  def change
    add_column :refinery_events, :count_url, :string
  end
end
