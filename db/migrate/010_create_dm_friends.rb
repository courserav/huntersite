class CreateDmFriends < ActiveRecord::Migration[5.2]
    def change
        create_table :dm_friends do |t|
            t.string :username
        end
    end
end