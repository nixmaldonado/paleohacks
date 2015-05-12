class Topic < ActiveRecord::Base
has_many :question_topics

validates :name, presence: true
end
