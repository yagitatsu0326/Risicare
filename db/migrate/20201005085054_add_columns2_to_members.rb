class AddColumns2ToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :image_id, :string
    add_column :members, :introduction, :string
  end
end
