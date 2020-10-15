class RemoveMemberIdFromAnswers < ActiveRecord::Migration[5.2]
  def change
    remove_column :answers, :member_id, :integer
  end
end
