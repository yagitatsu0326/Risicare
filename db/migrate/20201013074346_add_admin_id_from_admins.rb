class AddAdminIdFromAdmins < ActiveRecord::Migration[5.2]
  def change
  	add_column :admins, :answer_id, :integer
  end
end
