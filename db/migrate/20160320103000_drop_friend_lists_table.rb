class DropFriendListsTable < ActiveRecord::Migration
  def up
    drop_table :friend_lists
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
