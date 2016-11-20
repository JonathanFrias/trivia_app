class CreateTriviaQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :trivia_questions do |t|
      t.string :question
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
