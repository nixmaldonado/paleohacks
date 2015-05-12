class QuestionsController < ApplicationController

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
    @topics = Topic.all
  end

  def create
    @question = current_user.questions.new(question_params)
    @topic = Topic.find(params[:question][:topic_id])

    if @topic && @question.save
      @question.topics << @topic
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
    params.require(:question).permit(:body, :title)
  end

  def get_current_question
    @question = Question.find(params[:id])
  end

end
