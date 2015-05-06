class QuestionController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index ]
  before_action :get_current_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def show
    @answer = @question.answers.new
  end

  def new
    @question = current_user.questions.build
  end

  def create
    @question = current_user.questions.new(question_params)

    if @question.save
      redirect_to questions_path, notice: "Question Posted Succesfully"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to questions_path
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:topic).permit(:body, :title)
  end

  def get_current_question
    @question = Topic.find(params[:id])
  end

end
