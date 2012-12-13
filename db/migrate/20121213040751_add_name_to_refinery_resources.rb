class AddNameToRefineryResources < ActiveRecord::Migration
  def change
    add_column :refinery_resources, :name, :string
  end
end
