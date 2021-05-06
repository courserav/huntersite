class CreateLikes < ActiveRecord::Migration[5.2]
    def change
        create_table :likes do |t|
            t.boolean :true_if_like, default: nil
            t.string :comment_id
        end
    end
end