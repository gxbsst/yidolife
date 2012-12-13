# This migration comes from refinery_stories (originally 1)
class CreateStoriesStories < ActiveRecord::Migration

  def up
    create_table :refinery_stories do |t|
      t.string :title
      t.date :time
      t.text :content
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-stories"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/stories/stories"})
    end

    drop_table :refinery_stories

  end

end
