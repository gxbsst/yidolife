class AddUrlToRefineryPhoto < ActiveRecord::Migration
  def change
    add_column :refinery_photos, :url, :string
  end
end
