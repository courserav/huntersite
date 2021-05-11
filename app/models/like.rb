class Like < ApplicationRecord
    belongs_to :comment
    belongs_to :user
    validates :true_if_like, presence: true

    scope :return_likes, -> { where("true_if_like == true")}
    scope :return_dislikes, -> { where("true_if_like == false")}
end