class Tag < ApplicationRecord
  has_many :taggings
  has_many :trivia_questions, through: :taggings, dependent: :destroy
end
