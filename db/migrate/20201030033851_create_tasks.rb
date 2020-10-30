class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :process_id, null: false
      t.string :command
      t.string :user
      t.integer :virtual_size
      t.integer :resident_size
      t.integer :shareable_size
      t.string :state
      t.integer :cpu_percentage
      t.integer :memory_percentage

      t.timestamps

      t.index :process_id, unique: true
    end
  end
end
