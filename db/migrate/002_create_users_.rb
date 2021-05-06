class CreateUsers < ActiveRecord::Migration[5.2]
    def change
        create_table :users do |t|
            t.string :username
            t.string :email
            t.integer :currency
        end
    end
end

#password column is already there from has_secure_password off of bcrypt.
