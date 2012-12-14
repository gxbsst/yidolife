# This migration comes from refinery_feedbacks (originally 1)
class CreateFeedbacksFeedbacks < ActiveRecord::Migration

  def up
    create_table :refinery_feedbacks do |t|
      t.string :title
      t.text :description
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-feedbacks"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/feedbacks/feedbacks"})
    end

    drop_table :refinery_feedbacks

  end

end
