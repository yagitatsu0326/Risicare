class RemoveAdminIdFromQuestions < ActiveRecord::Migration[5.2]
  def change
  	remove_column :questions, :admin_id, :string
  end
end
