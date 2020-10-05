class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.integer :member_id
      t.integer :admin_id
      t.string :body
      t.string :image_id

      t.timestamps
    end
  end
end
