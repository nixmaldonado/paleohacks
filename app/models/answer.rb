class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many   :answer_votes

  validates  :body, presence: true
  validates  :correct , uniqueness: { scope: :question_id}

  def vote_count
    positives = 0
    negatives = 0

    answer_votes.each do |vote|
      if vote.positive?
        positives += 1
      else
        negatives += 1
    end
  end

  positives - negatives
  end

end
