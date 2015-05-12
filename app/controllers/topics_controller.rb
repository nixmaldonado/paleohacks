class TopicsController < ApplicationController

  before_action :get_current_topic, only: [:show]

  def index
    @topics = Topics.all
  end

  def show
    @questionTopics    = QuestionTopic.where(topic_id: "#{@topic.id}")
    #@question        = Question.find("#{@questionsTopics.question_id}")
  end

  private

  def get_current_topic
    @topic = Topic.find(params[:id])
  end
end
