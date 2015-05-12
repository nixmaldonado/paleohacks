class Question < ActiveRecord::Base
  belongs_to :user
  has_many   :answers
  has_many   :question_topics
  has_many   :topics, through: :question_topics

  validates :body, :title, presence: true

  attr_accessor :topic_id

end
