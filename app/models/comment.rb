class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :user
    has_many :likes

    validates :content, presence: { message: "Comment must not be blank." }
    validates :author, presence: true

    def show_author
        self.author
    end

end