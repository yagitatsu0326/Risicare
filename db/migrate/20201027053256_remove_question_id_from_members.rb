class RemoveQuestionIdFromMembers < ActiveRecord::Migration[5.2]
  def change
    remove_column :members, :question_id, :integer
  end
end
