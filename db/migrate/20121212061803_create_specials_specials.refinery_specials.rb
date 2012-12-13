# This migration comes from refinery_specials (originally 1)
class CreateSpecialsSpecials < ActiveRecord::Migration

  def up
    create_table :refinery_specials do |t|
      t.string :title
      t.text :content
      t.integer :topic_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-specials"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/specials/specials"})
    end

    drop_table :refinery_specials

  end

end
