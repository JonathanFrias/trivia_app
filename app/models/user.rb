class User < ApplicationRecord
  has_secure_password
  validates_presence_of :username
  validates_presence_of :email
  validates_format_of :email, with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  has_reputation :trivia_score, source: :trivia_question, aggregated_by: :sum
  has_reputation :question_score, source: :user, aggregated_by: :sum
end
