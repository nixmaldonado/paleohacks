class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

has_many :questions
has_many :answers

def upvote_question!(question)
   question.vote = true
end

def downvote_question!(question)
  question.vote = false
end


def upvote_answer!(answer)
  vote = true
end

def downvote_answer!(answer)
  vote = false
end


end
