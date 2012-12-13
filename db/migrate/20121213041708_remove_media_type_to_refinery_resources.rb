class RemoveMediaTypeToRefineryResources < ActiveRecord::Migration
  def up
    remove_column :refinery_resources, :media_type
  end

  def down
    add_column :refinery_resources, :media_type, :string
  end
end
