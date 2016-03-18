class CreateFriendLists < ActiveRecord::Migration
  def change
    create_table :friend_lists do |t|
      t.text :list
      t.string :type

      t.timestamps null: false
    end
  end
end
