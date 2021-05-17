class DmFriend < ApplicationRecord
    has_many :direct_messages
    has_many :users, through: :direct_messages

    validates :username, uniqueness: true
end