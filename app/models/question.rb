class Question < ApplicationRecord
    belongs_to :user
    has_many :answers
    has_many :comments, as: :commentable
    has_many :vote_questions
    validates :title, :body, presence: true


    def voted_by?(user)
        vote_questions.exists?(user: user)
    end
end
