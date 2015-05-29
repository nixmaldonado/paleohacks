class Question < ActiveRecord::Base
  belongs_to :user
  has_many   :answers
  has_many   :question_topics
  has_many   :question_votes
  has_many   :topics, through: :question_topics

  validates :body, :title, presence: true

  attr_accessor :topic_id

  def vote_count
    positives = 0
    negatives = 0

    question_votes.each do |vote|
      if vote.positive?
        positives += 1
      else
        negatives += 1
      end
    end

    positives - negatives
  end

  def owned_by?(current_user)
    current_user.id == user.id
  end


end
