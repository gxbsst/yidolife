# This migration comes from refinery_googlemaps (originally 1)
class CreateGooglemapsGooglemaps < ActiveRecord::Migration

  def up
    create_table :refinery_googlemaps do |t|
      t.integer :event_id
      t.string :address
      t.float :longitude
      t.float :latitude
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-googlemaps"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/googlemaps/googlemaps"})
    end

    drop_table :refinery_googlemaps

  end

end
