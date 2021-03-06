class CreateTopicsTopics < ActiveRecord::Migration

  def up
    create_table :refinery_topics do |t|
      t.string :title
      t.integer :photo_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-topics"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/topics/topics"})
    end

    drop_table :refinery_topics

  end

end
