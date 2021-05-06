class CreatePosts < ActiveRecord::Migration[5.2]
    def change
        create_table :posts do |t|
            t.string :text
            t.string :user_id
        end
    end
end