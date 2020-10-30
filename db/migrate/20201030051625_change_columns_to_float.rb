class ChangeColumnsToFloat < ActiveRecord::Migration[6.0]
  def change
    change_column :tasks, :cpu_percentage, :float
    change_column :tasks, :memory_percentage, :float
  end
end
