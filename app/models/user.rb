class User < ApplicationRecord
    has_secure_password
    has_many :posts #starting off basic. 
    has_many :likes, through: :comments

    validates :username, :email, presence: true
    validates :email, uniqueness: true

end