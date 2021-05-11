class Post < ApplicationRecord
    belongs_to :user #for starters, lets make the post relationship basic to belong to a user
    has_many :comments, dependent: :destroy
    has_many :likes, through: :comments
    has_one_attached :image

    validate :has_some_content
    validate :post_pay

    private

    def has_some_content
        if image.attached? == false && self.text? == false
            errors.add(:post, "Must have at least text or an image.")
        end
    end

    def post_pay
        if self.user.currency <= 0
            errors.add(:post, "Must have sufficient funds to post.")
        end
    end

end