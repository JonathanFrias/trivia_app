class HighScoreController < ApplicationController
  def index
    @high_scores = User.order(score: :desc).limit(10)
    @low_scores = User.order(score: :asc).limit(10)
    @avg_score = User.average(:score).to_i
  end
end
