class CreateInformation < ActiveRecord::Migration[5.2]
  def change
    create_table :information do |t|
      t.integer :genre_id
      t.string :title
      t.string :image_id
      t.text :body

      t.timestamps
    end
  end
end
