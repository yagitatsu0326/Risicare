class RemoveCheckFromNotifications < ActiveRecord::Migration[5.2]
  def change
    remove_column :notifications, :check, :boolean
  end
end
