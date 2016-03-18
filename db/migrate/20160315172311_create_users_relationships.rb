class CreateUsersRelationships < ActiveRecord::Migration
  def change
    create_table :users_relationships do |t|
      t.integer :user_id
      t.integer :list_id

      t.timestamps null: false
    end
  end
end
