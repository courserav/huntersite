class CreateComments < ActiveRecord::Migration[5.2]
    def change
        create_table :comments do |t|
            t.string :content
            t.string :user_id
            t.string :post_id
        end
    end
end