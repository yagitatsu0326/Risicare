class RemoveAnswerIdFromAdmins < ActiveRecord::Migration[5.2]
  def change
    remove_column :admins, :answer_id, :integer
  end
end
