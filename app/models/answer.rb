class Answer < ApplicationRecord
  belongs_to :trivia_question, required: true
  belongs_to :user

  validates_presence_of :answer, allow_blank: false

  def question_text
    trivia_question.question
  end

  def username
    user.username
  end
end
