class QuestionsController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index ]
  before_action :get_current_user, only: [:upvote, :downvote]
  before_action :get_current_question, only: [:upvote, :downvote, :show,
                                              :edit, :update, :destroy]

  def index
    @questions = Question.all
    @topic     = QuestionTopic.all
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

  def upvote
    current_user.upvote_question!(@question)
    redirect_to question_path(@question)
  end

  def downvote
    current_user.downvote_question!(@question)
    redirect_to question_path(@question)
  end

  private

  def get_current_user
    @user = current_user
  end

  def question_params
    params.require(:question).permit(:body, :title)
  end

  def get_current_question
    @question = Question.find(params[:id])
  end

end
