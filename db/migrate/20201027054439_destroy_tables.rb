class DestroyTables < ActiveRecord::Migration[5.2]
  def change
  	drop_table :genres
  	drop_table :information
  	drop_table :schedules
  end
end
