class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.string :title
      t.string :body
      t.time :start_time
      t.time :finish_time
      t.date :date

      t.timestamps
    end
  end
end
