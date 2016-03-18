class CreateUsersMessages < ActiveRecord::Migration
  def change
    create_table :users_messages do |t|
      t.integer :user_id
      t.integer :message_id
      t.boolean :is_sender
      t.boolean :is_readed

      t.timestamps null: false
    end
  end
end
