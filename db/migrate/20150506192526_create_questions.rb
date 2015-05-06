class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :body
      t.belongs_to :user, index: true, foreign_key: true
      t.string :topic
      t.integer :votes

      t.timestamps null: false
    end
  end
end
