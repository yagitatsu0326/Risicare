class AddAdminIdToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :admin_id, :integer
  end
end
