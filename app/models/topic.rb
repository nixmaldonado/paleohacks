class Topic < ActiveRecord::Base
has_many :question_topics

validates :topic, presence: true
end
