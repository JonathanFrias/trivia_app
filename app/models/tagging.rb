class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :trivia_question
end
