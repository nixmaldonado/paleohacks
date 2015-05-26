class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

  has_many :question_votes
  has_many :questions
  has_many :answers

  def upvote_question!(question)
    vote = question.question_votes.find_by(user_id: id)
    puts vote
    if vote
      return vote if vote.positive?
      vote.update(vote:true)
    else
      question.question_votes.create(vote: true, user_id: id)
    end
  end

  def downvote_question!(question)
    vote = question.question_votes.find_by(user_id: id)
    puts vote
    if vote
      return vote if vote.negative?
      vote.update(vote: false)
    else
      question.question_votes.create(vote: false, user_id: id)
    end
  end

  def upvote_answer!(answer)
    vote = true
  end

  def downvote_answer!(answer)
    vote = false
  end

  def upvoted_question?(question)
    vote = question.question_votes.find_by(user_id: id)
    if vote == nil
      return false
    elsif vote.positive?
      return true
    end
  end

  def downvoted_question?(question)
    vote = question.question_votes.find_by(user_id: id)
    if vote == nil
      return false
    elsif vote.negative?
      return true
    end
  end

end
