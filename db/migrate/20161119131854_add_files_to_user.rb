class AddFilesToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :solution_file_uid, :string
    add_column :users, :solution_file_name, :string
    add_column :users, :test_file_uid, :string
    add_column :users, :test_file_name, :string
  end
end
