class CreateQuestionTopics < ActiveRecord::Migration
  def change
    create_table :question_topics do |t|
      t.belongs_to :question, index: true, foreign_key: true
      t.belongs_to :topic, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
