class CreateFeedItems < ActiveRecord::Migration
  def change
    create_table :feed_items do |t|
      t.string :title
      t.text :message
      t.string :source

      t.timestamps
    end
  end
end
