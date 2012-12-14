class AddCategoryToResource < ActiveRecord::Migration
  def change
    add_column :refinery_resources, :category, :string
  end
end
