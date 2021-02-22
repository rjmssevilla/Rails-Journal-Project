class ChangeDataTypeForDeadline < ActiveRecord::Migration[6.1]
  def up
    change_column :tasks, :deadline, :datetime
  end
    
  def down
    change_column :tasks, :deadline, :string
  end
end
