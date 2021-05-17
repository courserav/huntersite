class DirectMessage < ApplicationRecord
    belongs_to :user
    belongs_to :dm_friend

    validates :content, presence: { message: "DM must not be blank." }

end