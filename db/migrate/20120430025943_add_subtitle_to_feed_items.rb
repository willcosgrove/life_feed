class AddSubtitleToFeedItems < ActiveRecord::Migration
  def change
    add_column :feed_items, :subtitle, :string
  end
end
