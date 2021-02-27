class ChangeDataTypeForDeadline < ActiveRecord::Migration[6.1]
  def up
    remove_column :tasks, :deadline
    add_column :tasks, :deadline, :datetime
  end
    
  def down
    remove_column :tasks, :deadline
    add_column :tasks, :deadline, :string
  end
end
