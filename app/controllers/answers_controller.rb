class AnswersController < ApplicationController

before_action :authenticate_user!, except: [:show, :index]
before_action :get_current_question
before_action :get_current_answer, only: [:show, :edit, :update, :destroy]

def create
  @answer = current_user.answers.new(answer_params)
  @answer.question_id = @question.id
  @answer.save
  redirect_to question_path(@question)
end

def new
  @answer = current_user.answers.new
end

private

  def get_current_question
    @question = Question.find(params[:id])
  end

  def get_current_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:body)
  end

end
