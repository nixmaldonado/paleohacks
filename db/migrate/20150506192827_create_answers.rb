class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :body
      t.boolean :correct
      t.belongs_to :question, index: true, foreign_key: true
      t.integer :votes

      t.timestamps null: false
    end
  end
end
