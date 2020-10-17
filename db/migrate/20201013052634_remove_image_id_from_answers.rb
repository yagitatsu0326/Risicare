class RemoveImageIdFromAnswers < ActiveRecord::Migration[5.2]
  def change
    remove_column :answers, :image_id, :string
  end
end
