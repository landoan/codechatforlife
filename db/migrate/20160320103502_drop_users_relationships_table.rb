class DropUsersRelationshipsTable < ActiveRecord::Migration
  def up
    drop_table :users_relationships
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
