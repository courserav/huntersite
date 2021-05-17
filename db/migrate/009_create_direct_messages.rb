class CreateDirectMessages < ActiveRecord::Migration[5.2]
    def change
        create_table :direct_messages do |t|
            t.string :content
            t.integer :user_id
            t.integer :dm_friend_id
        end
    end
end