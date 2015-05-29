class AnswersController < ApplicationController

before_action :authenticate_user!, except: [:show, :index]
before_action :get_current_question
before_action :get_current_answer, only: [:show, :edit, :update,
                                          :destroy, :upvote, :downvote,
                                          :correct]
before_action :check_user_permissions, only: [:correct]

  def new
    @answer = current_user.answers.new
  end

  def create
    @answer = current_user.answers.new(answer_params)
    @answer.question_id = @question.id
    @answer.save
    redirect_to question_path(@question)
  end

  def edit; end

  def update
    if @answer.update(answer_params)
      redirect_to question_path
    else
      render :edit
    end
  end

  def upvote
    current_user.upvote_answer!(@answer)
    redirect_to question_path(@question)
  end

  def downvote
    current_user.downvote_answer!(@answer)
    redirect_to question_path(@question)
  end

  def correct
      if @answer.correct!
        flash[:notice] = "Answer marked as correct!"
      else
        flash[:notice] = "Something went wrong, bad luck!"
      end
    redirect_to question_path(@question)
  end

protected

  def get_current_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:body)
  end

  def get_current_answer
    @answer = @question.answers.find(params[:id])
  end

  def check_user_permission
    unless (current_user.admin? || @question.owned_by?(current_user))
      flash[:notice] = "You shall not pass!"
      redirect_to question_path(@question)
    end
  end

end
