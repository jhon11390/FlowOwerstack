class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :vote_answers

  def voted_answer_by?(user)
    vote_answers.exists?(user: user)
  end
  
end
