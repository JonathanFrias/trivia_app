class TriviaQuestion < ApplicationRecord
  validates_presence_of :question, allow_blank: false
  belongs_to :user
end
