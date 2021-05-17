class User < ApplicationRecord
    has_secure_password
    has_many :posts #starting off basic. 
    has_many :likes, through: :comments
    has_many :direct_messages
    has_many :dm_friends, through :direct_messages

    validates :username, :email, presence: true
    validates :email, uniqueness: true

    scope :sort_by_currency, -> {order(currency: :desc)}
end