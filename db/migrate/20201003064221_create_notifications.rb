class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :notify_id
      t.integer :notified_id
      t.integer :like_id
      t.integer :post_id
      t.integer :comment_id
      t.string :action
      t.boolean :check

      t.timestamps
    end
  end
end
