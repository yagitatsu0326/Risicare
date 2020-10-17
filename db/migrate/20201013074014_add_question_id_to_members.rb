class AddQuestionIdToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :question_id, :integer
  end
end
