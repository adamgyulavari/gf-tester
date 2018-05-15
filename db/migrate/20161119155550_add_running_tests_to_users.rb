class AddRunningTestsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :running_tests, :integer
    add_column :users, :last_runned, :datetime
  end
end
