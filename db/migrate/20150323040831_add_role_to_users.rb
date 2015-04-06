class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string
    add_index :posts, :user_id
  end
end
