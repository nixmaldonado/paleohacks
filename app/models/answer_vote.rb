class AnswerVote < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer

  validates :user_id, :answer_id, presence: true
  validates :user_id, uniqueness: { scope: :answer_id }

  def positive?
    vote == true
  end

  def negative?
    vote == false
  end

end
