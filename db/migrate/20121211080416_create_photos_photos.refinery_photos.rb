# This migration comes from refinery_photos (originally 1)
class CreatePhotosPhotos < ActiveRecord::Migration

  def up
    create_table :refinery_photos do |t|
      t.string :title
      t.integer :picture_id
      t.text :content
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-photos"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/photos/photos"})
    end

    drop_table :refinery_photos

  end

end
