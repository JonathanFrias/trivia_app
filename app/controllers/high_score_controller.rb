class HighScoreController < ApplicationController
  def index
    @high_scores = scores('desc')
    @low_scores = scores('asc')
    @avg_score = avg_score
    @correct_streak = longest_correct_streak
    @incorrect_streak = longest_incorrect_streak
  end

  private

  HighScore = Struct.new("Score", :id, :score, :username)

  def scores(order='desc')
    RsEvaluation
      .where(target_type: "User", reputation_name: "trivia_score")
      .select("sum(value) as score, target_id, users.id, users.username")
      .group('target_id, "users"."id", "users"."username"')
      .reorder("score #{order}")
      .joins("JOIN users ON users.id = target_id")
      .limit(10)
      .map do |it|
        HighScore.new(it[:id], it[:score], it[:username])
      end
  end

  def avg_score
    sql = <<-SQL
    select avg(user_scores) from (
      SELECT sum(value) as user_scores
      FROM "rs_evaluations"
      WHERE "rs_evaluations"."target_type" = 'User'
      AND 	"rs_evaluations"."reputation_name" = 'trivia_score'
      GROUP BY "rs_evaluations"."target_id"
    ) as foo
    SQL
    results = ActiveRecord::Base.connection.execute(sql)
    results.first["avg"]
  end

  def longest_correct_streak
    User.order(:longest_correct_streak => :desc).first
  end

  def longest_incorrect_streak
    User.order(:longest_incorrect_streak => :desc).first
  end
end
