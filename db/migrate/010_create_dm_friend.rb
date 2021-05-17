class CreateDmFriend < ActiveRecord::Migration[5.2]
    def change
        create_table :dm_friend do |t|
            t.integer :direct_message_id
        end
    end
end