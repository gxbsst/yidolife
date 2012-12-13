class AddPictureIdToRefineryResources < ActiveRecord::Migration
  def change
    add_column :refinery_resources, :picture_id, :integer
  end
end
